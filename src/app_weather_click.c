/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_weather_click.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "app_weather_click.h"
#include "config/default/system/command/sys_command.h"
#include "definitions.h"

typedef struct
{
    char cmd;
    DRV_HANDLE drvHandle;
    volatile bool isBME280ReadDone;
    volatile bool isEEPROMWriteDone;
    volatile bool isEEPROMReadDone;
    volatile bool BME280Error;
    uint16_t rawTemperatureData;
    uint8_t temperature; 
    uint8_t wrBuffer[2];
    uint8_t rdBuffer[2];
}BME280_DATA;

/**
  Section: Weather Click Driver APIs
 */

/*
 * Called to read sensor data
 */
void Weather_readSensors(const DRV_HANDLE handle);

/*
 * Return compensated values in deg. Celsius,
 * kPascals, & %Relative Humidity
 */
float Weather_getTemperatureDegC(void);
float Weather_getPressureKPa(void);
float Weather_getHumidityRH(void);

void Weather_gotoSleep(const DRV_HANDLE handle);

/**
  Section: Macro Declarations
 */

#define DEFAULT_STANDBY_TIME    BME280_STANDBY_HALFMS
#define DEFAULT_FILTER_COEFF    BME280_FILTER_COEFF_OFF
#define DEFAULT_TEMP_OSRS       BME280_OVERSAMP_X1
#define DEFAULT_PRESS_OSRS      BME280_OVERSAMP_X1
#define DEFAULT_HUM_OSRS        BME280_OVERSAMP_X1
#define DEFAULT_SENSOR_MODE     BME280_FORCED_MODE

/**
  Section: Variable Definitions
 */

static uint8_t weather_initialized = 0;

/**
  Section: Private function prototypes
 */

void Weather_initializeClick(const DRV_HANDLE handle);

/**
  Section: Driver APIs
 */

void Weather_readSensors(const DRV_HANDLE handle) {
    if (!weather_initialized) {
        Weather_initializeClick(handle);
    }

    if (DEFAULT_SENSOR_MODE == BME280_FORCED_MODE) {
        BME280_startForcedSensing(handle);
    }

    while(BME280_isMeasuring(handle));
    BME280_readMeasurements(handle);
}

float Weather_getTemperatureDegC(void) {
    return BME280_getTemperature();
}

float Weather_getPressureKPa(void) {
    return BME280_getPressure();
}

float Weather_getHumidityRH(void) {
    return BME280_getHumidity();
}

void Weather_gotoSleep(const DRV_HANDLE handle) {
    BME280_sleep(handle);
    weather_initialized = 0;
}

void Weather_initializeClick(const DRV_HANDLE handle) {

    //CLICK_WEATHER_TimerStart();
    BME280_reset(handle);
    /* 100 m.sec delay */
    //CLICK_WEATHER_DelayMs(100);
    vTaskDelay(100 / portTICK_PERIOD_MS);
    BME280_readFactoryCalibrationParams(handle);
    BME280_setStandbyTime(DEFAULT_STANDBY_TIME);
    BME280_setFilterCoefficient(DEFAULT_FILTER_COEFF);
    BME280_setOversamplingTemperature(DEFAULT_TEMP_OSRS);
    BME280_setOversamplingPressure(DEFAULT_PRESS_OSRS);
    BME280_setOversamplingHumidity(DEFAULT_HUM_OSRS);
    BME280_setSensorMode(DEFAULT_SENSOR_MODE);
    BME280_initializeSensor(handle);

    weather_initialized = 1;
}

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_WEATHER_CLICK_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_WEATHER_CLICK_DATA app_weather_clickData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

static BME280_DATA appBME280SensorData;

static void APP_INST0_CLIENT1_Callback(DRV_BME280_EVENT event, uintptr_t context)
{
    BME280_DATA* pTempSensorData = (BME280_DATA*)context;
    
    switch(event)
    {
        case DRV_BME280_EVENT_BME280_READ_DONE:
            pTempSensorData->isBME280ReadDone = true;
            break;
        case DRV_BME280_EVENT_EEPROM_WRITE_DONE:
            pTempSensorData->isEEPROMWriteDone = true;
            break;
        case DRV_BME280_EVENT_EEPROM_READ_DONE:            
            pTempSensorData->isEEPROMReadDone = true;
            break;
        case DRV_BME280_EVENT_ERROR:
            pTempSensorData->BME280Error = true;
            break;
    }
}

void APP_IDLE(void)
{
    app_weather_clickData.state = APP_WEATHER_CLICK_STATE_IDLE;
}

const SYS_CMD_DESCRIPTOR appCmdTbl[]=
{
    {"idle",    (SYS_CMD_FNC)APP_IDLE, ": Exits the program after successfully copying the file"},
};

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_WEATHER_CLICK_Initialize ( void )

  Remarks:
    See prototype in app_weather_click.h.
 */

void APP_WEATHER_CLICK_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    app_weather_clickData.state = APP_WEATHER_CLICK_STATE_INIT;
    
    if (!SYS_CMD_ADDGRP(appCmdTbl, sizeof(appCmdTbl)/sizeof(*appCmdTbl), "Application", ": user commands"))
    {
        SYS_ERROR(SYS_ERROR_ERROR, "Failed to create Application Commands\r\n");
    }
    
    SYS_CMD_MESSAGE("HELLO WORLD \r\n");


    /* TODO: Initialize your application's state machine and other
     * parameters.
     */
}


/******************************************************************************
  Function:
    void APP_WEATHER_CLICK_Tasks ( void )

  Remarks:
    See prototype in app_weather_click.h.
 */

void APP_WEATHER_CLICK_Tasks ( void )
{
    volatile BME280_DATA* pBME280Data = &appBME280SensorData;
    /* Check the application's current state. */
    switch ( app_weather_clickData.state )
    {
        /* Application's initial state. */
        case APP_WEATHER_CLICK_STATE_INIT:
        {
            pBME280Data->drvHandle = DRV_BME280_Open(DRV_BME280_INDEX_0, 0);

            DRV_BME280_TransferEventHandlerSet(pBME280Data->drvHandle, APP_INST0_CLIENT1_Callback, (uintptr_t)pBME280Data);

            DRV_BME280_CONFIG_PARAMS configParams;
            configParams.eepromAddr = BME280_ADDR;
            configParams.bme280Addr = BME280_ADDR;
            configParams.transferParams.clockSpeed = 400000;

            /* Client-1 registers the transfer parameters (in other words, client specific data) */
            DRV_BME280_TransferSetup(pBME280Data->drvHandle, &configParams);
            //appI0C1tempSensorData.cmd = APP_WEATHER_CLICK_STATE_IDLE;;
            bool appInitialized = true;
            
            if (appInitialized)
            {
                app_weather_clickData.state = APP_WEATHER_CLICK_STATE_SERVICE_TASKS;
            }
            break;
        }

        case APP_WEATHER_CLICK_GET_ID:
        {
            pBME280Data->isBME280ReadDone = false;        
            pBME280Data->BME280Error = false;
            if (BME280_readByte(pBME280Data->drvHandle, BME280_ID_REG, (uint16_t*)&pBME280Data->rawTemperatureData) == true)
            {
                appI0C1tempSensorData.cmd = CMD_I0_C1_READ_TEMP_SENSOR_WAIT;
            }
            else
            {
                printf("I0-C1: Temperature read error!\r\n");
                appI0C1tempSensorData.cmd = CMD_I0_C1_IDLE;
            }
            break;
        }
        
        case APP_WEATHER_CLICK_STATE_SERVICE_TASKS:
        {
            pBME280Data->isBME280ReadDone = false;        
            pBME280Data->BME280Error = false;
            //Weather_initializeClick(pBME280Data->drvHandle);
            SYS_CMD_MESSAGE("HELLO WORLD Driver Initialized \r\n");
            uint8_t ID = BME280_getID(pBME280Data->drvHandle);
            SYS_CMD_PRINT("BME280 == %x \r\n", ID);
            app_weather_clickData.state = APP_WEATHER_CLICK_STATE_IDLE;
            break;
        }
        
        case APP_WEATHER_CLICK_STATE_IDLE:
        {
            break;
        }
        
        case APP_WEATHER_CLICK_STATE_READ_SENSORS:
        {
            break;
        }

        /* TODO: implement your application state machine.*/
        //SYS_CMD_MESSAGE("HELLO WORLD \r\n");

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}


/*******************************************************************************
 End of File
 */

//driver_xxx_definitions.h : contains data structures and definitions that will be needed by initialization.c file
    //This file along with the driver_xxx.h file gets included in the definitions.h file which in turn is included in the initialization.c file
//driver_xxx_local.h : contains data structures and definitions that are local to the driver
    //-->includes driver_xxx_definitions file as the driver_xxx_local may use some of the definitions defined in this file
//driver_xxx.h : contains data structues, definitions and function prototypes. This file will be included by application using this driver.
   //-->includes driver_xxx_definitions file as the driver_xxx_local may use some of the definitions defined in this file
//driver_xxx.c : contains driver implementation and public APIs.
  //-->includes driver_xxx.h file

//------------------------------------------------------------------------------------------------  

#include "drv_bme280.h"
#include "driver/i2c/drv_i2c.h"
#include <string.h>

/**
  Section: Macro Declarations
 */

// Register Addresses
#define BME280_ID_REG           0xD0
#define BME280_RESET_REG        0xE0
#define BME280_CTRL_HUM_REG     0xF2
#define BME280_STATUS_REG       0xF3
#define BME280_CTRL_MEAS_REG    0xF4
#define BME280_CONFIG_REG       0xF5
#define BME280_PRESS_MSB_REG    0xF7
#define BME280_PRESS_LSB_REG    0xF8
#define BME280_PRESS_XLSB_REG   0xF9
#define BME280_TEMP_MSB_REG     0xFA
#define BME280_TEMP_LSB_REG     0xFB
#define BME280_TEMP_XLSB_REG    0xFC
#define BME280_HUM_MSB_REG      0xFD
#define BME280_HUM_LSB_REG      0xFE

// Sensor Data Read Bytes
#define BME280_PRESS_MSB        0
#define BME280_PRESS_LSB        1
#define BME280_PRESS_XLSB       2
#define BME280_TEMP_MSB         3
#define BME280_TEMP_LSB         4
#define BME280_TEMP_XLSB        5
#define BME280_HUM_MSB          6
#define BME280_HUM_LSB          7
#define BME280_DATA_FRAME_SIZE  8

// Factory Calibration Parameters
#define BME280_CALIB_DT1_LSB_REG    0x88
#define BME280_CALIB_DT1_MSB_REG    0x89
#define BME280_CALIB_DT2_LSB_REG    0x8A
#define BME280_CALIB_DT2_MSB_REG    0x8B
#define BME280_CALIB_DT3_LSB_REG    0x8C
#define BME280_CALIB_DT3_MSB_REG    0x8D
#define BME280_CALIB_DP1_LSB_REG    0x8E
#define BME280_CALIB_DP1_MSB_REG    0x8F
#define BME280_CALIB_DP2_LSB_REG    0x90
#define BME280_CALIB_DP2_MSB_REG    0x91
#define BME280_CALIB_DP3_LSB_REG    0x92
#define BME280_CALIB_DP3_MSB_REG    0x93
#define BME280_CALIB_DP4_LSB_REG    0x94
#define BME280_CALIB_DP4_MSB_REG    0x95
#define BME280_CALIB_DP5_LSB_REG    0x96
#define BME280_CALIB_DP5_MSB_REG    0x97
#define BME280_CALIB_DP6_LSB_REG    0x98
#define BME280_CALIB_DP6_MSB_REG    0x99
#define BME280_CALIB_DP7_LSB_REG    0x9A
#define BME280_CALIB_DP7_MSB_REG    0x9B
#define BME280_CALIB_DP8_LSB_REG    0x9C
#define BME280_CALIB_DP8_MSB_REG    0x9D
#define BME280_CALIB_DP9_LSB_REG    0x9E
#define BME280_CALIB_DP9_MSB_REG    0x9F
#define BME280_CALIB_DH1_REG        0xA1
#define BME280_CALIB_DH2_LSB_REG    0xE1
#define BME280_CALIB_DH2_MSB_REG    0xE2
#define BME280_CALIB_DH3_REG        0xE3
#define BME280_CALIB_DH4_MSB_REG    0xE4
#define BME280_CALIB_DH4_LSB_REG    0xE5
#define BME280_CALIB_DH5_MSB_REG    0xE6
#define BME280_CALIB_DH6_REG        0xE7

#define APP_TEMP_TEMPERATURE_REG_ADDR               0x00

/**
  Section: Variable Definitions
 */

typedef union {

    struct {
        uint8_t im_update : 1;
        uint8_t: 2;
        uint8_t measuring : 1;
        uint8_t: 4;
    };
    uint8_t statusReg;
} bme280_status_t;

typedef union {

    struct {
        uint8_t mode : 2;
        uint8_t osrs_P : 3;
        uint8_t osrs_T : 3;
    };
    uint8_t ctrlMeasReg;
} bme280_ctrl_meas_t;

typedef union {

    struct {
        uint8_t spi3w_en : 1;
        uint8_t filter : 3;
        uint8_t t_sb : 3;
    };
    uint8_t configReg;
} bme280_config_t;

typedef struct {
    uint16_t dig_T1;
    int dig_T2;
    int dig_T3;
    uint16_t dig_P1;
    int dig_P2;
    int dig_P3;
    int dig_P4;
    int dig_P5;
    int dig_P6;
    int dig_P7;
    int dig_P8;
    int dig_P9;
    uint8_t dig_H1;
    int dig_H2;
    uint8_t dig_H3;
    int dig_H4;
    int dig_H5;
    signed char dig_H6;
} bme280_calibration_param_t;

bme280_config_t bme280_config;
uint8_t bme280_ctrl_hum;
bme280_ctrl_meas_t bme280_ctrl_meas;
bme280_status_t bme280_status;
bme280_calibration_param_t calibParam;

long adc_T, adc_H, adc_P, t_fine;

DRV_BME280_OBJ gDrvBME280Obj[DRV_BME280_INSTANCES_NUMBER];

/**
  Section: Private function prototypes
 */

uint8_t BME280_getStatus(const DRV_HANDLE handle);
static long BME280_compensateTemperature(void);
static uint32_t BME280_compensatePressure(void);
static uint32_t BME280_compensateHumidity(void);

bool DRV_BME280_writeByte(const DRV_HANDLE handle, uint8_t reg_addr, uint8_t data);
void BME280_writeBlock(uint8_t *write_buff, uint8_t length);
bool BME280_readByte(const DRV_HANDLE handle, uint8_t reg_addr, uint8_t* data);
bool BME280_readBlock(const DRV_HANDLE handle, uint8_t reg_addr, uint8_t *read_buff, uint8_t length);

/**
  Section: Driver APIs
 */

//uint8_t BME280_getID(const DRV_HANDLE handle) {
//    return BME280_readByte(handle, BME280_ID_REG);
//}

void BME280_reset(const DRV_HANDLE handle) {
    DRV_BME280_writeByte(handle, BME280_RESET_REG, BME280_SOFT_RESET);
}

void BME280_sleep(const DRV_HANDLE handle) {
    bme280_ctrl_meas.mode = BME280_SLEEP_MODE;
    DRV_BME280_writeByte(handle, BME280_CTRL_MEAS_REG, bme280_ctrl_meas.ctrlMeasReg);
}

void BME280_readFactoryCalibrationParams(const DRV_HANDLE handle) {
    uint8_t paramBuff[24]={0};

    BME280_readBlock(handle, BME280_CALIB_DT1_LSB_REG, paramBuff, 24);
    calibParam.dig_T1 = (((uint16_t) paramBuff[1]) << 8) + paramBuff[0];
    calibParam.dig_T2 = (((int) paramBuff[3]) << 8) + paramBuff[2];
    calibParam.dig_T3 = (((int) paramBuff[5]) << 8) + paramBuff[4];
    calibParam.dig_P1 = (((uint16_t) paramBuff[7]) << 8) + paramBuff[6];
    calibParam.dig_P2 = (((int) paramBuff[9]) << 8) + paramBuff[8];
    calibParam.dig_P3 = (((int) paramBuff[11]) << 8) + paramBuff[10];
    calibParam.dig_P4 = (((int) paramBuff[13]) << 8) + paramBuff[12];
    calibParam.dig_P5 = (((int) paramBuff[15]) << 8) + paramBuff[14];
    calibParam.dig_P6 = (((int) paramBuff[17]) << 8) + paramBuff[16];
    calibParam.dig_P7 = (((int) paramBuff[19]) << 8) + paramBuff[18];
    calibParam.dig_P8 = (((int) paramBuff[21]) << 8) + paramBuff[20];
    calibParam.dig_P9 = (((int) paramBuff[23]) << 8) + paramBuff[22];

    calibParam.dig_H1 = (uint8_t) BME280_readByte(handle, BME280_CALIB_DH1_REG);

    BME280_readBlock(handle, BME280_CALIB_DH2_LSB_REG, paramBuff, 7);
    calibParam.dig_H2 = (((int) paramBuff[1]) << 8) + paramBuff[0];
    calibParam.dig_H3 = (uint8_t) paramBuff[2];
    calibParam.dig_H4 = (((int) paramBuff[3]) << 4) | (paramBuff[4] & 0xF);
    calibParam.dig_H5 = (((int) paramBuff[5]) << 4) | (paramBuff[4] >> 4);
    calibParam.dig_H6 = (short) paramBuff[6];
}

void BME280_setStandbyTime(uint8_t sbtime) {
    bme280_config.t_sb = sbtime;
}

void BME280_setFilterCoefficient(uint8_t coeff) {
    bme280_config.filter = coeff;
}

void BME280_setOversamplingTemperature(uint8_t osrs_t) {
    bme280_ctrl_meas.osrs_T = osrs_t;
}

void BME280_setOversamplingPressure(uint8_t osrs_p) {
    bme280_ctrl_meas.osrs_P = osrs_p;
}

void BME280_setOversamplingHumidity(uint8_t osrs_h) {
    bme280_ctrl_hum = osrs_h;
}

void BME280_setSensorMode(uint8_t mode) {
    bme280_ctrl_meas.mode = mode;
}

void BME280_initializeSensor(const DRV_HANDLE handle) {
    DRV_BME280_writeByte(handle, BME280_CONFIG_REG, bme280_config.configReg);
    DRV_BME280_writeByte(handle, BME280_CTRL_HUM_REG, bme280_ctrl_hum);
    DRV_BME280_writeByte(handle, BME280_CTRL_MEAS_REG, bme280_ctrl_meas.ctrlMeasReg);
}

void BME280_startForcedSensing(const DRV_HANDLE handle) {
    bme280_ctrl_meas.mode = BME280_FORCED_MODE;
    DRV_BME280_writeByte(handle, BME280_CTRL_MEAS_REG, bme280_ctrl_meas.ctrlMeasReg);
}

uint8_t BME280_isMeasuring(const DRV_HANDLE handle) {
    bme280_status.statusReg = BME280_getStatus(handle);
    return (bme280_status.measuring);
}

void BME280_readMeasurements(const DRV_HANDLE handle) {
    uint8_t sensorData[BME280_DATA_FRAME_SIZE]={0};

    BME280_readBlock(handle, BME280_PRESS_MSB_REG, sensorData, BME280_DATA_FRAME_SIZE);

    adc_H = ((uint32_t) sensorData[BME280_HUM_MSB] << 8) |
            sensorData[BME280_HUM_LSB];

    adc_T = ((uint32_t) sensorData[BME280_TEMP_MSB] << 12) |
            (((uint32_t) sensorData[BME280_TEMP_LSB] << 4) |
            ((uint32_t) sensorData[BME280_TEMP_XLSB] >> 4));

    adc_P = ((uint32_t) sensorData[BME280_PRESS_MSB] << 12) |
            (((uint32_t) sensorData[BME280_PRESS_LSB] << 4) |
            ((uint32_t) sensorData[BME280_PRESS_XLSB] >> 4));
}

float BME280_getTemperature(void) {
    float temperature = (float) BME280_compensateTemperature() / 100;
    return temperature;
}

float BME280_getPressure(void) {
    float pressure = (float) BME280_compensatePressure() / 1000;
    return pressure;
}

float BME280_getHumidity(void) {
    float humidity = (float) BME280_compensateHumidity() / 1024;
    return humidity;
}

uint8_t BME280_getStatus(const DRV_HANDLE handle) {
    bme280_status.statusReg = BME280_readByte(handle, BME280_STATUS_REG);
    return bme280_status.statusReg;
}

/*
 * Returns temperature in DegC, resolution is 0.01 DegC.
 * Output value of "5123" equals 51.23 DegC.
 */
static long BME280_compensateTemperature(void) {
    long tempV1, tempV2, t;

    tempV1 = ((((adc_T >> 3) - ((long) calibParam.dig_T1 << 1))) * ((long) calibParam.dig_T2)) >> 11;
    tempV2 = (((((adc_T >> 4) - ((long) calibParam.dig_T1)) * ((adc_T >> 4) - ((long) calibParam.dig_T1))) >> 12)*((long) calibParam.dig_T3)) >> 14;
    t_fine = tempV1 + tempV2;
    t = (t_fine * 5 + 128) >> 8;

    return t;
}

/*
 * Returns pressure in Pa as unsigned 32 bit integer.
 * Output value of "96386" equals 96386 Pa = 96.386 kPa
 */
static uint32_t BME280_compensatePressure(void) {
    long pressV1, pressV2;
    uint32_t p;

    pressV1 = (((long) t_fine) >> 1) - (long) 64000;
    pressV2 = (((pressV1 >> 2) * (pressV1 >> 2)) >> 11) * ((long) calibParam.dig_P6);
    pressV2 = pressV2 + ((pressV1 * ((long) calibParam.dig_P5)) << 1);
    pressV2 = (pressV2 >> 2)+(((long) calibParam.dig_P4) << 16);
    pressV1 = (((calibParam.dig_P3 * (((pressV1 >> 2) * (pressV1 >> 2)) >> 13)) >> 3) +
            ((((long) calibParam.dig_P2) * pressV1) >> 1)) >> 18;
    pressV1 = ((((32768 + pressV1))*((long) calibParam.dig_P1)) >> 15);

    if (pressV1 == 0) {
        // avoid exception caused by division by zero
        return 0;
    }

    p = (((uint32_t) (((long) 1048576) - adc_P)-(pressV2 >> 12)))*3125;
    if (p < 0x80000000) {
        p = (p << 1) / ((uint32_t) pressV1);
    } else {
        p = (p / (uint32_t) pressV1) * 2;
    }

    pressV1 = (((long) calibParam.dig_P9) * ((long) (((p >> 3) * (p >> 3)) >> 13))) >> 12;
    pressV2 = (((long) (p >> 2)) * ((long) calibParam.dig_P8)) >> 13;
    p = (uint32_t) ((long) p + ((pressV1 + pressV2 + calibParam.dig_P7) >> 4));

    return p;
}

/*
 * Returns humidity in %RH as unsigned 32 bit integer in Q22.10 format
 * (22 integer and 10 fractional bits).
 * Output value of "47445" represents 47445/1024 = 46.333 %RH
 */
static uint32_t BME280_compensateHumidity(void) {
    long humV;
    uint32_t h;

    humV = (t_fine - ((long) 76800));
    humV = (((((adc_H << 14) - (((long) calibParam.dig_H4) << 20) - (((long) calibParam.dig_H5) * humV)) +
            ((long) 16384)) >> 15) * (((((((humV * ((long) calibParam.dig_H6)) >> 10) *
            (((humV * ((long) calibParam.dig_H3)) >> 11) + ((long) 32768))) >> 10) +
            ((long) 2097152)) * ((long) calibParam.dig_H2) + 8192) >> 14));
    humV = (humV - (((((humV >> 15) * (humV >> 15)) >> 7) * ((long) calibParam.dig_H1)) >> 4));
    humV = (humV < 0 ? 0 : humV);
    humV = (humV > 419430400 ? 419430400 : humV);

    h = (uint32_t) (humV >> 12);
    return h;
}

//void BME280_writeBlock(uint8_t *write_buff, uint8_t length) {
//    CLICK_WEATHER_I2C_Write(BME280_ADDR, write_buff, length);
//    while(CLICK_WEATHER_I2C_IsBusy() == true);
//}

//void BME280_readBlock(uint8_t reg_addr, uint8_t *read_buff, uint8_t length) {
//    uint8_t txBuffer_Read_Addr[1];
//    txBuffer_Read_Addr[0] =  reg_addr;
//
//    CLICK_WEATHER_I2C_WriteRead(BME280_ADDR, txBuffer_Read_Addr, 1, read_buff, length);
//    while(CLICK_WEATHER_I2C_IsBusy() == true);
//
//}

static void DRV_BME280_DRVEventHandler( DRV_I2C_TRANSFER_EVENT event, DRV_I2C_TRANSFER_HANDLE transferHandle, uintptr_t context )
{
    DRV_BME280_CLIENT_OBJ* clientObj = (DRV_BME280_CLIENT_OBJ*)context;
    DRV_BME280_OBJ* dObj = &gDrvBME280Obj[clientObj->drvIndex];
    DRV_I2C_TRANSFER_HANDLE transHandle;       
        
    if (clientObj->wrInProgress == true && event == DRV_I2C_TRANSFER_EVENT_COMPLETE)
    {    
        clientObj->wrInProgress = false;
        
        // Initiate checking of EEPROM's write busy status
        clientObj->wrBuffer[0] = 0xFF;
        
        dObj->drvInterface->write(clientObj->i2cDrvHandle, clientObj->configParams.eepromAddr, (void *)clientObj->wrBuffer, 1, &transHandle);
        
        if (transHandle != DRV_I2C_TRANSFER_HANDLE_INVALID)
        {
            clientObj->eepChkBusyStatus = true;
        }
    }
    else if (clientObj->eepChkBusyStatus == true)
    {
        if (event == DRV_I2C_TRANSFER_EVENT_ERROR)
        {
            // EEPROM is still busy with the internal write. Keep checking for the EEPROM write busy status.
            clientObj->wrBuffer[0] = 0xFF;

            dObj->drvInterface->write(clientObj->i2cDrvHandle, clientObj->configParams.eepromAddr, (void *)clientObj->wrBuffer, 1, &transHandle);
            
            if (transHandle == DRV_I2C_TRANSFER_HANDLE_INVALID)
            {
                clientObj->eepChkBusyStatus = false;
            }
        }
        else
        {
            // EEPROM internal write is completed.
            clientObj->eepChkBusyStatus = false;
        }
    }
    
    //if (clientObj->wrInProgress == false && clientObj->eepChkBusyStatus == false)
    //{
        if(event != DRV_I2C_TRANSFER_EVENT_COMPLETE)
        {
            clientObj->event = DRV_BME280_EVENT_ERROR;
        }
        
        clientObj->isBusy = false;
                    
        if(clientObj->callback != NULL)
        {
            clientObj->callback(clientObj->event, clientObj->context);
        }
    //}
}

static DRV_BME280_CLIENT_OBJ* DRV_BME280_ClientObjGet(const DRV_HANDLE handle)
{
    uint32_t drvIndex = handle >> 8;
    uint32_t clientIndex = handle & 0xFF;
    
    if (drvIndex < DRV_BME280_INSTANCES_NUMBER)
    {
        if (clientIndex < gDrvBME280Obj[drvIndex].maxClients)
        {
            if (gDrvBME280Obj[drvIndex].clientObj[clientIndex].inUse == true)
            {
                return &gDrvBME280Obj[drvIndex].clientObj[clientIndex];
            }
        }
    }
    
    return NULL;
}

static int32_t DRV_BME280_FreeClientGet(DRV_BME280_OBJ* dObj)
{
    for (int32_t i = 0; i < dObj->maxClients; i++)
    {
        if (dObj->clientObj[i].inUse == false)
        {
            dObj->clientObj[i].inUse = true;
            return i;
        }
    }
    
    return -1;
}

SYS_MODULE_OBJ DRV_BME280_Initialize(
    const SYS_MODULE_INDEX drvIndex,
    const SYS_MODULE_INIT* const init
)
{
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_BME280_INIT* BME280Init = (DRV_BME280_INIT*)init;
    
    /* Validate the request */
    if(drvIndex >= DRV_BME280_INSTANCES_NUMBER)
    {
        return SYS_MODULE_OBJ_INVALID;
    }
    else
    {
        dObj = &gDrvBME280Obj[drvIndex];
    }

    /* Is the driver instance already initialized? */
    if(dObj->isInitialized == true)
    {
        return SYS_MODULE_OBJ_INVALID;
    }    

    dObj->nClients = 0;

    dObj->drvInterface = BME280Init->drvInterface;
    
    dObj->clientObj = (DRV_BME280_CLIENT_OBJ*)BME280Init->clientObj;
    
    dObj->maxClients = BME280Init->maxClients;
    
    dObj->i2cDrvIndex = BME280Init->i2cDrvIndex;
    
    dObj->isInitialized = true;
    
    return (SYS_MODULE_OBJ)drvIndex;
}

DRV_HANDLE DRV_BME280_Open(
    const SYS_MODULE_INDEX drvIndex,
    const DRV_IO_INTENT ioIntent
)
{
    int32_t clientObjIndex;
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_BME280_CLIENT_OBJ* clientObj = NULL;
    
    /* Validate the request */
    if(drvIndex >= DRV_BME280_INSTANCES_NUMBER)
    {
        return DRV_HANDLE_INVALID;
    }
    
    dObj = &gDrvBME280Obj[drvIndex];
    
    /* Driver must be initialized before it can be opened by a client. Also, it must not already be in use (opened state). */
    if(dObj->isInitialized == false || dObj->nClients >= dObj->maxClients)
    {
        return DRV_HANDLE_INVALID;
    }
    else
    {
        clientObjIndex = DRV_BME280_FreeClientGet(dObj);
        
        if (clientObjIndex >= 0)
        {
            clientObj = &dObj->clientObj[clientObjIndex];
            
            clientObj->i2cDrvHandle = dObj->drvInterface->open(dObj->i2cDrvIndex, 0);

            dObj->drvInterface->callbackRegister(clientObj->i2cDrvHandle, DRV_BME280_DRVEventHandler, (uintptr_t)clientObj);
            
            clientObj->drvIndex = drvIndex;

            dObj->nClients += 1;
            
            return ((uint32_t)drvIndex << 8) | (clientObjIndex);
        }
    }
    
    return DRV_HANDLE_INVALID;
    
}

void DRV_BME280_Close(const DRV_HANDLE handle)
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj = NULL;
    
    if (clientObj != NULL)
    {
        dObj = &gDrvBME280Obj[clientObj->drvIndex];
        //TODO: Call I2C driver's close API
        dObj->nClients--;
        clientObj->inUse = false;
    }
}

void DRV_BME280_TransferEventHandlerSet(
    const DRV_HANDLE handle,
    const DRV_BME280_APP_CALLBACK callback,
    const uintptr_t context
)
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    
    if (clientObj != NULL)
    {
        clientObj->callback = callback;
        clientObj->context = context;
    }        
}

uint8_t DRV_BME280_TemperatureGet(const DRV_HANDLE handle, uint16_t* temperatureData)
{
    int16_t temp;
    (void)handle;

    // Convert the temperature value read from sensor to readable format (Degree Celsius)
    // For demonstration purpose, temperature value is assumed to be positive.
    // The maximum positive temperature measured by sensor is +125 C
    temp = (*temperatureData << 8) | (*temperatureData >> 8);
    temp = (temp >> 7) * 0.5;
    return (uint8_t)temp;    
}

bool DRV_BME280_writeByte(const DRV_HANDLE handle, uint8_t reg_addr, uint8_t data) 
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    
    if (clientObj == NULL)
    {
        return false;
    }
    if (clientObj->isBusy == true)
    {
        return false;
    }
    
    clientObj->isBusy = true;
    
    dObj = &gDrvBME280Obj[clientObj->drvIndex];
        
    clientObj->wrBuffer[0] = reg_addr;
    
    clientObj->wrBuffer[1] = data;
    
    clientObj->wrInProgress = true;
    
    clientObj->event = DRV_BME280_EVENT_EEPROM_WRITE_DONE;
    
    dObj->drvInterface->write(clientObj->i2cDrvHandle, clientObj->configParams.eepromAddr, (void*)clientObj->wrBuffer, 1 + 1, &transferHandle);
    
    if (transferHandle != DRV_I2C_TRANSFER_HANDLE_INVALID)
    {
        return true;
    }
    else
    {        
        clientObj->isBusy = false;
        clientObj->wrInProgress = false;
        return false;
    }
}

bool BME280_readByte(const DRV_HANDLE handle, uint8_t reg_addr, uint8_t* rdBuffer) {
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    
    if (clientObj == NULL)
    {
        return false;
    }
    if (clientObj->isBusy == true)
    {
        return false;
    }
    
    clientObj->isBusy = true;
    
    dObj = &gDrvBME280Obj[clientObj->drvIndex];
    
    clientObj->wrBuffer[0] = reg_addr;
    
    clientObj->event = DRV_BME280_EVENT_EEPROM_READ_DONE;
    
    dObj->drvInterface->writeRead(clientObj->i2cDrvHandle, clientObj->configParams.bme280Addr, (void*)clientObj->wrBuffer, 1, (void *)rdBuffer, 1, &transferHandle);
    
    
    if (transferHandle != DRV_I2C_TRANSFER_HANDLE_INVALID)
    {
        return true;
    }
    else
    {
        clientObj->isBusy = false;
        return false;
    }
}

bool BME280_readBlock(const DRV_HANDLE handle, uint8_t reg_addr, uint8_t *read_buff, uint8_t length)
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    
    if (clientObj == NULL)
    {
        return false;
    }
    if (clientObj->isBusy == true)
    {
        return false;
    }
    
    clientObj->isBusy = true;
    
    dObj = &gDrvBME280Obj[clientObj->drvIndex];
    
    clientObj->wrBuffer[0] = reg_addr;
    
    clientObj->event = DRV_BME280_EVENT_EEPROM_READ_DONE;
    
    dObj->drvInterface->writeRead(clientObj->i2cDrvHandle, clientObj->configParams.eepromAddr, (void*)clientObj->wrBuffer, 1, (void *)read_buff, length, &transferHandle);
    
    if (transferHandle != DRV_I2C_TRANSFER_HANDLE_INVALID)
    {
        return true;
    }
    else
    {        
        clientObj->isBusy = false;
        return false;
    }
}

bool DRV_BME280_TemperatureRead(const DRV_HANDLE handle, uint16_t* temperatureData)
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    
    if (clientObj == NULL)
    {
        return false;
    }
    
    if (clientObj->isBusy == true)
    {
        return false;
    }
    
    clientObj->isBusy = true;
    
    dObj = &gDrvBME280Obj[clientObj->drvIndex];
    
    clientObj->wrBuffer[0] = APP_TEMP_TEMPERATURE_REG_ADDR;
    
    clientObj->event = DRV_BME280_EVENT_BME280_READ_DONE;
    
    dObj->drvInterface->writeRead(clientObj->i2cDrvHandle, clientObj->configParams.bme280Addr, (void*)clientObj->wrBuffer, 1, (void *)temperatureData, 2, &transferHandle);
    
    if (transferHandle != DRV_I2C_TRANSFER_HANDLE_INVALID)
    {
        return true;
    }
    else
    {        
        clientObj->isBusy = false;
        return false;
    }
}

bool DRV_BME280_EEPROMWrite(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* wrBuffer, uint8_t nWrBytes)
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    
    if (clientObj == NULL)
    {
        return false;
    }
    if (clientObj->isBusy == true)
    {
        return false;
    }
    
    clientObj->isBusy = true;
    
    dObj = &gDrvBME280Obj[clientObj->drvIndex];
        
    clientObj->wrBuffer[0] = memAddr;
    
    memcpy(&clientObj->wrBuffer[1], wrBuffer, nWrBytes);
    
    clientObj->wrInProgress = true;
    
    clientObj->event = DRV_BME280_EVENT_EEPROM_WRITE_DONE;
    
    dObj->drvInterface->write(clientObj->i2cDrvHandle, clientObj->configParams.eepromAddr, (void*)clientObj->wrBuffer, nWrBytes + 1, &transferHandle);
    
    if (transferHandle != DRV_I2C_TRANSFER_HANDLE_INVALID)
    {
        return true;
    }
    else
    {        
        clientObj->isBusy = false;
        clientObj->wrInProgress = false;
        return false;
    }
}

bool DRV_BME280_EEPROMRead(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* rdBuffer, uint8_t nRdBytes)
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj     = NULL;
    DRV_I2C_TRANSFER_HANDLE transferHandle;
    
    if (clientObj == NULL)
    {
        return false;
    }
    if (clientObj->isBusy == true)
    {
        return false;
    }
    
    clientObj->isBusy = true;
    
    dObj = &gDrvBME280Obj[clientObj->drvIndex];
    
    clientObj->wrBuffer[0] = memAddr;
    
    clientObj->event = DRV_BME280_EVENT_EEPROM_READ_DONE;
    
    dObj->drvInterface->writeRead(clientObj->i2cDrvHandle, clientObj->configParams.eepromAddr, (void*)clientObj->wrBuffer, 1, (void *)rdBuffer, nRdBytes, &transferHandle);
    
    if (transferHandle != DRV_I2C_TRANSFER_HANDLE_INVALID)
    {
        return true;
    }
    else
    {        
        clientObj->isBusy = false;
        return false;
    }
}

bool DRV_BME280_TransferSetup(const DRV_HANDLE handle, DRV_BME280_CONFIG_PARAMS* configParams)
{
    DRV_BME280_CLIENT_OBJ* clientObj = DRV_BME280_ClientObjGet(handle);
    DRV_BME280_OBJ* dObj     = NULL;
    
    if (clientObj == NULL)
    {
        return false;
    }
    
    dObj = &gDrvBME280Obj[clientObj->drvIndex];

    clientObj->configParams = *configParams;
    
    dObj->drvInterface->transferSetup(clientObj->i2cDrvHandle, (DRV_I2C_TRANSFER_SETUP*)&clientObj->configParams.transferParams);
    
    return true;
    
}


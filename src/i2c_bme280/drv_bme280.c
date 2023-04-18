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

DRV_BME280_OBJ gDrvBME280Obj[DRV_BME280_INSTANCES_NUMBER];

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
    
    if (clientObj->wrInProgress == false && clientObj->eepChkBusyStatus == false)
    {
        if(event != DRV_I2C_TRANSFER_EVENT_COMPLETE)
        {
            clientObj->event = DRV_BME280_EVENT_ERROR;
        }
        
        clientObj->isBusy = false;
                    
        if(clientObj->callback != NULL)
        {
            clientObj->callback(clientObj->event, clientObj->context);
        }
    }
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
    
    clientObj->event = DRV_BME280_EVENT_TEMP_READ_DONE;
    
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


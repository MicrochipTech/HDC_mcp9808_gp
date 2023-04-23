
#ifndef DRV_MCP9808_LOCAL_H
#define DRV_MCP9808_LOCAL_H

#include "drv_mcp9808_definitions.h"

typedef struct
{
    bool inUse;
    bool isBusy;
    bool wrInProgress;
    bool eepChkBusyStatus;
    DRV_MCP9808_APP_CALLBACK callback; 
    uintptr_t context;
    uint8_t drvIndex;
    DRV_HANDLE i2cDrvHandle;
    uint8_t wrBuffer[17];
    DRV_MCP9808_CONFIG_PARAMS configParams;
    DRV_MCP9808_EVENT event; 
}DRV_MCP9808_CLIENT_OBJ;

typedef struct
{
    bool isInitialized;
    uint8_t nClients;    
    uint8_t maxClients;
    uint8_t i2cDrvIndex;
    const DRV_MCP9808_DRV_INTERFACE* drvInterface;
    DRV_MCP9808_CLIENT_OBJ* clientObj;    
}DRV_MCP9808_OBJ;

#endif      //DRV_TEMP_SENSOR_LOCAL_H
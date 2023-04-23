
#ifndef DRV_MCP9808_H
#define DRV_MCP9808_H

#include "drv_mcp9808_definitions.h"
#include "drv_mcp9808_local.h"

//Public API interface, function declarations
SYS_MODULE_OBJ DRV_MCP9808_Initialize( const SYS_MODULE_INDEX drvIndex, const SYS_MODULE_INIT* const init);

DRV_HANDLE DRV_MCP9808_Open(const SYS_MODULE_INDEX drvIndex, const DRV_IO_INTENT ioIntent);

void DRV_MCP9808_Close(const DRV_HANDLE handle);

void DRV_MCP9808_TransferEventHandlerSet( const DRV_HANDLE handle, const DRV_MCP9808_APP_CALLBACK callback, const uintptr_t context);

uint8_t DRV_MCP9808_TemperatureGet(const DRV_HANDLE handle, uint16_t* temperatureData);

bool DRV_MCP9808_TemperatureRead(const DRV_HANDLE handle, uint16_t* temperatureData);

bool DRV_MCP9808_EEPROMWrite(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* wrBuffer, uint8_t nWrBytes);

bool DRV_MCP9808_EEPROMRead(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* rdBuffer, uint8_t nRdBytes);

bool DRV_MCP9808_TransferSetup(const DRV_HANDLE handle, DRV_MCP9808_CONFIG_PARAMS* configParams);

#endif      //DRV_TEMP_SENSOR_H


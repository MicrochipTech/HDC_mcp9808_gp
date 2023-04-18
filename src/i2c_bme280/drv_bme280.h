/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _DRV_BME280_H    /* Guard against multiple inclusion */
#define _DRV_BME280_H

#include "drv_bme280_definitions.h"
#include "drv_bme280_local.h"

//Public API interface, function declarations
SYS_MODULE_OBJ DRV_BME280_Initialize( const SYS_MODULE_INDEX drvIndex, const SYS_MODULE_INIT* const init);

DRV_HANDLE DRV_BME280_Open(const SYS_MODULE_INDEX drvIndex, const DRV_IO_INTENT ioIntent);

void DRV_BME280_Close(const DRV_HANDLE handle);

void DRV_BME280_TransferEventHandlerSet( const DRV_HANDLE handle, const DRV_BME280_APP_CALLBACK callback, const uintptr_t context);

uint8_t DRV_BME280_TemperatureGet(const DRV_HANDLE handle, uint16_t* temperatureData);

bool DRV_BME280_TemperatureRead(const DRV_HANDLE handle, uint16_t* temperatureData);

bool DRV_BME280_EEPROMWrite(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* wrBuffer, uint8_t nWrBytes);

bool DRV_BME280_EEPROMRead(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* rdBuffer, uint8_t nRdBytes);

bool DRV_BME280_TransferSetup(const DRV_HANDLE handle, DRV_BME280_CONFIG_PARAMS* configParams);


#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */

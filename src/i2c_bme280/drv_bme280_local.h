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

#ifndef _DRV_BME280_LOCAL_H    /* Guard against multiple inclusion */
#define _DRV_BME280_LOCAL_H


#include "drv_bme280_definitions.h"

typedef struct
{
    bool inUse;
    bool isBusy;
    bool wrInProgress;
    bool eepChkBusyStatus;
    DRV_BME280_APP_CALLBACK callback; 
    uintptr_t context;
    uint8_t drvIndex;
    DRV_HANDLE i2cDrvHandle;
    uint8_t wrBuffer[17];
    DRV_BME280_CONFIG_PARAMS configParams;
    DRV_BME280_EVENT event; 
}DRV_BME280_CLIENT_OBJ;

typedef struct
{
    bool isInitialized;
    uint8_t nClients;    
    uint8_t maxClients;
    uint8_t i2cDrvIndex;
    const DRV_BME280_DRV_INTERFACE* drvInterface;
    DRV_BME280_CLIENT_OBJ* clientObj;    
}DRV_BME280_OBJ;

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */

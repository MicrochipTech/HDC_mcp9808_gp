#ifndef DRV_MCP9808_DEFINITIONS_H
#define DRV_MCP9808_DEFINITIONS_H

#include "stddef.h"
#include "system/system_module.h"
#include "driver/driver.h"
#include "driver/driver_common.h"
#include "system/int/sys_int.h"
#include "driver/i2c/drv_i2c.h"

typedef enum
{
    DRV_MCP9808_ERROR_NONE,
    DRV_MCP9808_ERROR_NACK,
    DRV_MCP9808_ERROR_BUS,
} DRV_MCP9808_ERROR;

typedef enum
{
    DRV_MCP9808_EVENT_TEMP_READ_DONE = 0,
    DRV_MCP9808_EVENT_EEPROM_WRITE_DONE,
    DRV_MCP9808_EVENT_EEPROM_READ_DONE,
    DRV_MCP9808_EVENT_ERROR,
} DRV_MCP9808_EVENT;

typedef struct
{
    /* clock speed */
    uint32_t clockSpeed;
} DRV_MCP9808_TRANSFER_SETUP;

typedef struct
{
    uint8_t tempSensorAddr;
    uint8_t eepromAddr;    
    DRV_MCP9808_TRANSFER_SETUP transferParams;
}DRV_MCP9808_CONFIG_PARAMS;

// function prototype of application callback function
typedef void (*DRV_MCP9808_APP_CALLBACK)(DRV_MCP9808_EVENT event, uintptr_t context);

// function prototype of callback registered by driver with the PLIB
typedef void (* DRV_MCP9808_PLIB_CALLBACK)( uintptr_t context);

// function prototypes of PLIB APIs
typedef bool (* DRV_MCP9808_PLIB_READ)( uint16_t, uint8_t *, uint32_t );
typedef bool (* DRV_MCP9808_PLIB_WRITE)( uint16_t, uint8_t *, uint32_t );
typedef bool (* DRV_MCP9808_PLIB_WRITE_READ)( uint16_t, uint8_t *, uint32_t, uint8_t *, uint32_t );
typedef DRV_MCP9808_ERROR (* DRV_MCP9808_PLIB_ERROR_GET)( void );
typedef bool (* DRV_MCP9808_PLIB_TRANSFER_SETUP)(DRV_MCP9808_TRANSFER_SETUP* setup, uint32_t srcClkFreq);
typedef void (* DRV_MCP9808_PLIB_CALLBACK_REGISTER)(DRV_MCP9808_PLIB_CALLBACK, uintptr_t);

typedef struct
{
    DRV_MCP9808_PLIB_READ                           read;
    DRV_MCP9808_PLIB_WRITE                          write;
    DRV_MCP9808_PLIB_WRITE_READ                     writeRead;
    DRV_MCP9808_PLIB_ERROR_GET                      errorGet;
    DRV_MCP9808_PLIB_TRANSFER_SETUP                 transferSetup;
    DRV_MCP9808_PLIB_CALLBACK_REGISTER              callbackRegister;
} DRV_MCP9808_PLIB_INTERFACE;

// function prototypes of Driver APIs
typedef DRV_HANDLE (*DRV_MCP9808_DRV_OPEN)(
    const SYS_MODULE_INDEX drvIndex,
    const DRV_IO_INTENT ioIntent
);

typedef void (*DRV_MCP9808_DRV_CLOSE)(const DRV_HANDLE handle);

typedef bool (* DRV_MCP9808_DRV_WRITE)(const DRV_HANDLE handle,
    const uint16_t address,
    void* const writeBuffer,
    const size_t writeSize,
    DRV_I2C_TRANSFER_HANDLE* const transferHandle);
typedef bool (* DRV_MCP9808_DRV_READ)(const DRV_HANDLE handle,
    const uint16_t address,
    void* const readBuffer,
    const size_t readSize,
    DRV_I2C_TRANSFER_HANDLE* const transferHandle);
typedef bool (* DRV_MCP9808_DRV_WRITE_READ)(const DRV_HANDLE handle,
    const uint16_t address,
    void* const writeBuffer,
    const size_t writeSize,
    void* const readBuffer,
    const size_t readSize,
    DRV_I2C_TRANSFER_HANDLE* const transferHandle);
typedef DRV_MCP9808_ERROR (* DRV_MCP9808_DRV_ERROR_GET)( const DRV_I2C_TRANSFER_HANDLE transferHandle );
typedef bool (* DRV_MCP9808_DRV_TRANSFER_SETUP)(const DRV_HANDLE handle, DRV_I2C_TRANSFER_SETUP* setup);
typedef void (* DRV_MCP9808_DRV_CALLBACK_REGISTER)(const DRV_HANDLE handle, const DRV_I2C_TRANSFER_EVENT_HANDLER eventHandler, const uintptr_t context);

typedef struct
{
    DRV_MCP9808_DRV_OPEN                           open;
    DRV_MCP9808_DRV_CLOSE                          close;
    DRV_MCP9808_DRV_WRITE                          write;
    DRV_MCP9808_DRV_READ                           read;
    DRV_MCP9808_DRV_WRITE_READ                     writeRead;
    DRV_MCP9808_DRV_ERROR_GET                      errorGet;
    DRV_MCP9808_DRV_TRANSFER_SETUP                 transferSetup;
    DRV_MCP9808_DRV_CALLBACK_REGISTER              callbackRegister;
} DRV_MCP9808_DRV_INTERFACE;

    typedef struct
    {
    const DRV_MCP9808_DRV_INTERFACE* drvInterface;
    const uintptr_t clientObj;
    uint8_t maxClients;
    uint8_t i2cDrvIndex;
}DRV_MCP9808_INIT;

#endif      //DRV_TEMP_SENSOR_DEFINITIONS_H
/*
 * Generated by Bluespec Compiler, version 2023.01 (build 52adafa5)
 * 
 * To automatically register this VPI wrapper with a Verilog simulator use:
 *     #include "vpi_wrapper_c_host_send2.h"
 *     void (*vlog_startup_routines[])() = { c_host_send2_vpi_register, 0u };
 */
#include <stdlib.h>
#include <vpi_user.h>
#include "bdpi.h"

/* the type of the wrapped function */
void c_host_send2(char );

/* VPI wrapper function */
PLI_INT32 c_host_send2_calltf(PLI_BYTE8 *user_data)
{
  vpiHandle hCall;
  char arg_1;
  vpiHandle *handle_array;
  
  /* retrieve handle array */
  hCall = vpi_handle(vpiSysTfCall, 0);
  handle_array = vpi_get_userdata(hCall);
  if (handle_array == NULL)
  {
    vpiHandle hArgList;
    hArgList = vpi_iterate(vpiArgument, hCall);
    handle_array = malloc(sizeof(vpiHandle) * 1u);
    handle_array[0u] = vpi_scan(hArgList);
    vpi_put_userdata(hCall, handle_array);
    vpi_free_object(hArgList);
  }
  
  /* copy in argument values */
  get_vpi_arg(handle_array[0u], &arg_1, DIRECT);
  
  /* call the imported C function */
  c_host_send2(arg_1);
  
  /* free argument storage */
  free_vpi_args();
  vpi_free_object(hCall);
  
  return 0;
}

/* VPI wrapper registration function */
void c_host_send2_vpi_register()
{
  s_vpi_systf_data tf_data;
  
  /* Fill in registration data */
  tf_data.type = vpiSysTask;
  tf_data.tfname = "$imported_c_host_send2";
  tf_data.calltf = c_host_send2_calltf;
  tf_data.compiletf = 0u;
  tf_data.sizetf = 0u;
  tf_data.user_data = "$imported_c_host_send2";
  
  /* Register the function with VPI */
  vpi_register_systf(&tf_data);
}

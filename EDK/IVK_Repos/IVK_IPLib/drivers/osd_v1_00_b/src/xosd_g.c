/* $Id: */
/******************************************************************************
*
*       XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
*       AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
*       SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
*       OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
*       APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
*       THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
*       AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
*       FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
*       WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
*       IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
*       REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
*       INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*       FOR A PARTICULAR PURPOSE.
*
*       (c) Copyright 2008 Xilinx Inc.
*       All rights reserved.
*
******************************************************************************/
/*****************************************************************************/
/**
*
* @file xosd_g.c
*
* This file contains a template for configuration table of Xilinx MVI Video
* On-Screen-Display (OSD) devices. For a real hardware system, Xilinx Platform
* Studio (XPS) will automatically generate a real configuration table to match
* the configuration of the OSD devices.
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- -------------------------------------------------------
* 1.00a xd   08/18/08 First release
* </pre>
*
******************************************************************************/


/***************************** Include Files *********************************/


#include "xparameters.h"
#include "xosd.h"

/*
 * The configuration table for On-Screen-Display devices
 */

XOSD_Config XOSD_ConfigTable[] =
{
	{
        XPAR_OSD_0_DEVICE_ID,
        XPAR_OSD_0_BASEADDR,
        XPAR_OSD_0_NUM_LAYERS,

		XPAR_OSD_0_LAYER0_TYPE,
		XPAR_OSD_0_LAYER1_TYPE,
		XPAR_OSD_0_LAYER2_TYPE,
		XPAR_OSD_0_LAYER3_TYPE,
		XPAR_OSD_0_LAYER4_TYPE,
		XPAR_OSD_0_LAYER5_TYPE,
		XPAR_OSD_0_LAYER6_TYPE,
		XPAR_OSD_0_LAYER7_TYPE,

        XPAR_OSD_0_LAYER0_IMEM_SIZE,
        XPAR_OSD_0_LAYER0_INS_BOX_EN,
        XPAR_OSD_0_LAYER0_INS_LINE_EN,
        XPAR_OSD_0_LAYER0_INS_TEXT_EN,
        XPAR_OSD_0_LAYER0_CLUT_SIZE,
        XPAR_OSD_0_LAYER0_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER0_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER0_FONT_WIDTH,
        XPAR_OSD_0_LAYER0_FONT_HEIGHT,
        XPAR_OSD_0_LAYER0_FONT_BPP,
        XPAR_OSD_0_LAYER0_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER0_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER0_TEXT_MAX_STRING_LENGTH,

        XPAR_OSD_0_LAYER1_IMEM_SIZE,
        XPAR_OSD_0_LAYER1_INS_BOX_EN,
        XPAR_OSD_0_LAYER1_INS_LINE_EN,
        XPAR_OSD_0_LAYER1_INS_TEXT_EN,
        XPAR_OSD_0_LAYER1_CLUT_SIZE,
        XPAR_OSD_0_LAYER1_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER1_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER1_FONT_WIDTH,
        XPAR_OSD_0_LAYER1_FONT_HEIGHT,
        XPAR_OSD_0_LAYER1_FONT_BPP,
        XPAR_OSD_0_LAYER1_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER1_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER1_TEXT_MAX_STRING_LENGTH,

        XPAR_OSD_0_LAYER2_IMEM_SIZE,
        XPAR_OSD_0_LAYER2_INS_BOX_EN,
        XPAR_OSD_0_LAYER2_INS_LINE_EN,
        XPAR_OSD_0_LAYER2_INS_TEXT_EN,
        XPAR_OSD_0_LAYER2_CLUT_SIZE,
        XPAR_OSD_0_LAYER2_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER2_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER2_FONT_WIDTH,
        XPAR_OSD_0_LAYER2_FONT_HEIGHT,
        XPAR_OSD_0_LAYER2_FONT_BPP,
        XPAR_OSD_0_LAYER2_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER2_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER2_TEXT_MAX_STRING_LENGTH,

        XPAR_OSD_0_LAYER3_IMEM_SIZE,
        XPAR_OSD_0_LAYER3_INS_BOX_EN,
        XPAR_OSD_0_LAYER3_INS_LINE_EN,
        XPAR_OSD_0_LAYER3_INS_TEXT_EN,
        XPAR_OSD_0_LAYER3_CLUT_SIZE,
        XPAR_OSD_0_LAYER3_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER3_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER3_FONT_WIDTH,
        XPAR_OSD_0_LAYER3_FONT_HEIGHT,
        XPAR_OSD_0_LAYER3_FONT_BPP,
        XPAR_OSD_0_LAYER3_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER3_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER3_TEXT_MAX_STRING_LENGTH,

        XPAR_OSD_0_LAYER4_IMEM_SIZE,
        XPAR_OSD_0_LAYER4_INS_BOX_EN,
        XPAR_OSD_0_LAYER4_INS_LINE_EN,
        XPAR_OSD_0_LAYER4_INS_TEXT_EN,
        XPAR_OSD_0_LAYER4_CLUT_SIZE,
        XPAR_OSD_0_LAYER4_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER4_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER4_FONT_WIDTH,
        XPAR_OSD_0_LAYER4_FONT_HEIGHT,
        XPAR_OSD_0_LAYER4_FONT_BPP,
        XPAR_OSD_0_LAYER4_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER4_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER4_TEXT_MAX_STRING_LENGTH,

        XPAR_OSD_0_LAYER5_IMEM_SIZE,
        XPAR_OSD_0_LAYER5_INS_BOX_EN,
        XPAR_OSD_0_LAYER5_INS_LINE_EN,
        XPAR_OSD_0_LAYER5_INS_TEXT_EN,
        XPAR_OSD_0_LAYER5_CLUT_SIZE,
        XPAR_OSD_0_LAYER5_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER5_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER5_FONT_WIDTH,
        XPAR_OSD_0_LAYER5_FONT_HEIGHT,
        XPAR_OSD_0_LAYER5_FONT_BPP,
        XPAR_OSD_0_LAYER5_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER5_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER5_TEXT_MAX_STRING_LENGTH,

        XPAR_OSD_0_LAYER6_IMEM_SIZE,
        XPAR_OSD_0_LAYER6_INS_BOX_EN,
        XPAR_OSD_0_LAYER6_INS_LINE_EN,
        XPAR_OSD_0_LAYER6_INS_TEXT_EN,
        XPAR_OSD_0_LAYER6_CLUT_SIZE,
        XPAR_OSD_0_LAYER6_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER6_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER6_FONT_WIDTH,
        XPAR_OSD_0_LAYER6_FONT_HEIGHT,
        XPAR_OSD_0_LAYER6_FONT_BPP,
        XPAR_OSD_0_LAYER6_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER6_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER6_TEXT_MAX_STRING_LENGTH,

        XPAR_OSD_0_LAYER7_IMEM_SIZE,
        XPAR_OSD_0_LAYER7_INS_BOX_EN,
        XPAR_OSD_0_LAYER7_INS_LINE_EN,
        XPAR_OSD_0_LAYER7_INS_TEXT_EN,
        XPAR_OSD_0_LAYER7_CLUT_SIZE,
        XPAR_OSD_0_LAYER7_CLUT_MEMTYPE,
        XPAR_OSD_0_LAYER7_FONT_NUM_CHARS,
        XPAR_OSD_0_LAYER7_FONT_WIDTH,
        XPAR_OSD_0_LAYER7_FONT_HEIGHT,
        XPAR_OSD_0_LAYER7_FONT_BPP,
        XPAR_OSD_0_LAYER7_FONT_ASCII_OFFSET,
        XPAR_OSD_0_LAYER7_TEXT_NUM_STRINGS,
        XPAR_OSD_0_LAYER7_TEXT_MAX_STRING_LENGTH
    }
};
/* linker.ld - Linker command/script file */

/*
 * Copyright (c) 2019 STMicroelectronics
 *
 * SPDX-License-Identifier: Apache-2.0
 */


#include <zephyr/arch/arm/aarch32/cortex_m/scripts/linker.ld>

MEMORY
{
	LINKER_DT_REGIONS()

	/* Used by and documented in include/linker/intlist.ld */
	MMIO_REGION	(wx)	:	ORIGIN = 0x10050000, LENGTH = 32K
}

SECTIONS
{

#include <zephyr/linker/rel-sections.ld>
#ifdef CONFIG_OPENAMP_RSC_TABLE

	SECTION_PROLOGUE(.resource_table,, SUBALIGN(4))
	{
		KEEP(*(.resource_table*))
	} GROUP_LINK_IN(ROMABLE_REGION)
#endif

	SECTION_PROLOGUE(.mmio_table,, SUBALIGN(4))
	{
		KEEP(*(.mmio_table*))
	} GROUP_LINK_IN(MMIO_REGION)
}

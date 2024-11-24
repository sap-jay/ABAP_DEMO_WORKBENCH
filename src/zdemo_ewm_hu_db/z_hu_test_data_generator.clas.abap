CLASS z_hu_test_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      create_hu_header_data,
      create_hu_item_data.

    DATA: current_timestamp TYPE timestampl.
ENDCLASS.

CLASS z_hu_test_data_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    GET TIME STAMP FIELD current_timestamp.

    " Create test data
    create_hu_header_data( ).
    create_hu_item_data( ).

    out->write( 'Handling Unit test data generated successfully.' ).
  ENDMETHOD.

  METHOD create_hu_header_data.
    " Insert Handling Unit Header data
    INSERT zscwm_huhdr FROM TABLE @( VALUE #(
    (
      client = '100' huident = '1000000001' hutyp = 'PAL'
      packmaterial = 'WOOD-PAL-001'
      weight = '450.000' weight_unit = 'KG'
      volume = '1.500' volume_unit = 'M3'
      length = '1.200' width = '0.800' height = '1.600' dimension_unit = 'M'
      status = '1' warehouse_no = '001' storage_loc = 'FG01'
      storage_bin = 'A-01-01' plant = '1000' door = 'G01'
      valid_from = sy-datum valid_to = '99991231'
      created_date = sy-datum created_time = sy-uzeit
      created_by = sy-uname createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' huident = '1000000002' hutyp = 'BOX'
      packmaterial = 'CART-BOX-001'
      weight = '25.000' weight_unit = 'KG'
      volume = '0.125' volume_unit = 'M3'
      length = '0.500' width = '0.500' height = '0.500' dimension_unit = 'M'
      status = '1' warehouse_no = '001' storage_loc = 'FG02'
      storage_bin = 'B-02-01' plant = '1000' door = 'G02'
      valid_from = sy-datum valid_to = '99991231'
      created_date = sy-datum created_time = sy-uzeit
      created_by = sy-uname createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' huident = '1000000003' hutyp = 'CTN'
      packmaterial = 'CART-CTN-001'
      weight = '75.000' weight_unit = 'KG'
      volume = '0.400' volume_unit = 'M3'
      length = '0.800' width = '0.600' height = '0.800' dimension_unit = 'M'
      status = '2' warehouse_no = '001' storage_loc = 'FG01'
      storage_bin = 'C-03-01' plant = '1000' door = 'G03'
      valid_from = sy-datum valid_to = '99991231'
      created_date = sy-datum created_time = sy-uzeit
      created_by = sy-uname createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).
  ENDMETHOD.

  METHOD create_hu_item_data.
    " Insert Handling Unit Item data
    INSERT zscwm_huitm FROM TABLE @( VALUE #(
    (
      client = '100' huident = '1000000001' item_no = '0001'
      material = 'FIN-PROD-001' material_desc = 'Finished Product 1'
      batch = 'BATCH001' quantity = '100.000' base_uom = 'PC'
      stock_type = '1' spec_stock = '' delivery = '8000000001'
      delivery_item = '000010' sales_order = '4500000001'
      sales_order_item = '000010' storage_loc = 'FG01' plant = '1000'
      status = '1' created_date = sy-datum created_time = sy-uzeit
      created_by = sy-uname createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' huident = '1000000001' item_no = '0002'
      material = 'FIN-PROD-002' material_desc = 'Finished Product 2'
      batch = 'BATCH002' quantity = '150.000' base_uom = 'PC'
      stock_type = '1' spec_stock = '' delivery = '8000000001'
      delivery_item = '000020' sales_order = '4500000001'
      sales_order_item = '000020' storage_loc = 'FG01' plant = '1000'
      status = '1' created_date = sy-datum created_time = sy-uzeit
      created_by = sy-uname createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' huident = '1000000002' item_no = '0001'
      material = 'FIN-PROD-003' material_desc = 'Finished Product 3'
      batch = 'BATCH003' quantity = '50.000' base_uom = 'PC'
      stock_type = '1' spec_stock = '' delivery = '8000000002'
      delivery_item = '000010' sales_order = '4500000002'
      sales_order_item = '000010' storage_loc = 'FG02' plant = '1000'
      status = '1' created_date = sy-datum created_time = sy-uzeit
      created_by = sy-uname createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' huident = '1000000003' item_no = '0001'
      material = 'FIN-PROD-004' material_desc = 'Finished Product 4'
      batch = 'BATCH004' quantity = '75.000' base_uom = 'PC'
      stock_type = '2' spec_stock = '' delivery = '8000000003'
      delivery_item = '000010' sales_order = '4500000003'
      sales_order_item = '000010' storage_loc = 'FG01' plant = '1000'
      status = '2' created_date = sy-datum created_time = sy-uzeit
      created_by = sy-uname createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).
  ENDMETHOD.

ENDCLASS.

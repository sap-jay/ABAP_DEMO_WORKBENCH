CLASS z_bp_test_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      create_bp_general_data,
      create_bp_addresses,
      create_bp_relationships,
      create_bp_bank_data.

    DATA: current_timestamp TYPE timestampl.
ENDCLASS.

CLASS z_bp_test_data_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    GET TIME STAMP FIELD current_timestamp.

    " Create test data in sequence to maintain referential integrity
    create_bp_general_data( ).
    create_bp_addresses( ).
    create_bp_relationships( ).
    create_bp_bank_data( ).

    out->write( 'Test data generation completed successfully.' ).
  ENDMETHOD.

  METHOD create_bp_general_data.
    " Insert Business Partner General Data I
    INSERT zbut000 FROM TABLE @( VALUE #(
    (
      client = '100' partner = '0000100000' type = '1' title = '0001'
      name_first = 'John' name_last = 'Smith' searchterm1 = 'SMITH'
      birthdate = '19800115' grouping = 'EMPL' is_person = abap_true
      gender = '1' createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100001' type = '1' title = '0002'
      name_first = 'Jane' name_last = 'Doe' searchterm1 = 'DOE'
      birthdate = '19850320' grouping = 'EMPL' is_person = abap_true
      gender = '2' createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100002' type = '2'
      name_org1 = 'Tech Corp Ltd' name_org2 = 'Technology Division'
      searchterm1 = 'TECHCORP' grouping = 'CORP' is_person = abap_false
      createdby = sy-uname changedby = sy-uname
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).

    " Insert Business Partner General Data II
    INSERT zbut001 FROM TABLE @( VALUE #(
    (
      client = '100' partner = '0000100000'
      langu = 'E' currency = 'USD' country = 'US' region = 'CA'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100001'
      langu = 'E' currency = 'USD' country = 'US' region = 'NY'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100002'
      langu = 'E' currency = 'USD' country = 'US' region = 'TX'
      industry = 'TECH' legal_form = 'CO'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).
  ENDMETHOD.

  METHOD create_bp_addresses.
    INSERT zbut020 FROM TABLE @( VALUE #(
    (
      client = '100' partner = '0000100000' addrnumber = '1'
      valid_from = '20240101' valid_to = '99991231'
      street = 'Oak Street' house_num = '123'
      post_code = '94025' city = 'San Francisco'
      country = 'US' region = 'CA' time_zone = 'PST'
      addr_type = '1' locallastchanged = current_timestamp
      lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100001' addrnumber = '1'
      valid_from = '20240101' valid_to = '99991231'
      street = 'Broadway' house_num = '456'
      post_code = '10013' city = 'New York'
      country = 'US' region = 'NY' time_zone = 'EST'
      addr_type = '1' locallastchanged = current_timestamp
      lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100002' addrnumber = '1'
      valid_from = '20240101' valid_to = '99991231'
      street = 'Tech Boulevard' house_num = '789'
      post_code = '75001' city = 'Dallas'
      country = 'US' region = 'TX' time_zone = 'CST'
      addr_type = '1' locallastchanged = current_timestamp
      lastchanged = current_timestamp
    ) ) ).
  ENDMETHOD.

  METHOD create_bp_relationships.
    " Create relationships between Business Partners
    INSERT zbut050 FROM TABLE @( VALUE #(
    (
      client = '100' partner1 = '0000100002' partner2 = '0000100000'
      relationtype = 'BUR001' valid_from = '20240101' valid_to = '99991231'
      stdrelation = abap_true relat_cat = 'BUS'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner1 = '0000100002' partner2 = '0000100001'
      relationtype = 'BUR001' valid_from = '20240101' valid_to = '99991231'
      stdrelation = abap_true relat_cat = 'BUS'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).

    " Create contact person relationships
    INSERT zbut051 FROM TABLE @( VALUE #(
    (
      client = '100' partner1 = '0000100002' partner2 = '0000100000'
      cpfunction = 'EMPL' department = 'IT'
      valid_from = '20240101' valid_to = '99991231'
      main_contact = abap_true
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner1 = '0000100002' partner2 = '0000100001'
      cpfunction = 'EMPL' department = 'SALES'
      valid_from = '20240101' valid_to = '99991231'
      main_contact = abap_false
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).
  ENDMETHOD.

  METHOD create_bp_bank_data.
    " Create bank master data
    INSERT zbut0bank FROM TABLE @( VALUE #(
    (
      client = '100' partner = '0000100000' bankid = '0001'
      bank_ctry = 'US' bank_key = '021000021'
      bank_acct = '123456789'
      iban = 'US02100002112345678'
      swift_code = 'CHASUS33'
      valid_from = '20240101' valid_to = '99991231'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100002' bankid = '0001'
      bank_ctry = 'US' bank_key = '026009593'
      bank_acct = '987654321'
      iban = 'US02600959398765432'
      swift_code = 'BOFAUS3N'
      valid_from = '20240101' valid_to = '99991231'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).

    " Create bank details
    INSERT zbut0bk FROM TABLE @( VALUE #(
    (
      client = '100' partner = '0000100000' bankid = '0001'
      bank_name = 'JPMorgan Chase Bank' branch = 'San Francisco'
      region = 'CA' street = 'Market Street'
      city = 'San Francisco' swift_code = 'CHASUS33'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    )
    (
      client = '100' partner = '0000100002' bankid = '0001'
      bank_name = 'Bank of America' branch = 'Dallas'
      region = 'TX' street = 'Main Street'
      city = 'Dallas' swift_code = 'BOFAUS3N'
      locallastchanged = current_timestamp lastchanged = current_timestamp
    ) ) ).
  ENDMETHOD.

ENDCLASS.

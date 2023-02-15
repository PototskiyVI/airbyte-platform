begin;
    
        
        
    

    

    merge into "INTEGRATION_TEST_NORMALIZATION".TEST_NORMALIZATION."DEDUP_EXCHANGE_RATE_SCD" as DBT_INTERNAL_DEST
        using "INTEGRATION_TEST_NORMALIZATION".TEST_NORMALIZATION."DEDUP_EXCHANGE_RATE_SCD__dbt_tmp" as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE._AIRBYTE_UNIQUE_KEY_SCD = DBT_INTERNAL_DEST._AIRBYTE_UNIQUE_KEY_SCD
        

    
    when matched then update set
        "_AIRBYTE_UNIQUE_KEY" = DBT_INTERNAL_SOURCE."_AIRBYTE_UNIQUE_KEY","_AIRBYTE_UNIQUE_KEY_SCD" = DBT_INTERNAL_SOURCE."_AIRBYTE_UNIQUE_KEY_SCD","ID" = DBT_INTERNAL_SOURCE."ID","CURRENCY" = DBT_INTERNAL_SOURCE."CURRENCY","DATE" = DBT_INTERNAL_SOURCE."DATE","TIMESTAMP_COL" = DBT_INTERNAL_SOURCE."TIMESTAMP_COL","HKD@spéçiäl & characters" = DBT_INTERNAL_SOURCE."HKD@spéçiäl & characters","HKD_SPECIAL___CHARACTERS" = DBT_INTERNAL_SOURCE."HKD_SPECIAL___CHARACTERS","NZD" = DBT_INTERNAL_SOURCE."NZD","USD" = DBT_INTERNAL_SOURCE."USD","_AIRBYTE_START_AT" = DBT_INTERNAL_SOURCE."_AIRBYTE_START_AT","_AIRBYTE_END_AT" = DBT_INTERNAL_SOURCE."_AIRBYTE_END_AT","_AIRBYTE_ACTIVE_ROW" = DBT_INTERNAL_SOURCE."_AIRBYTE_ACTIVE_ROW","_AIRBYTE_AB_ID" = DBT_INTERNAL_SOURCE."_AIRBYTE_AB_ID","_AIRBYTE_EMITTED_AT" = DBT_INTERNAL_SOURCE."_AIRBYTE_EMITTED_AT","_AIRBYTE_NORMALIZED_AT" = DBT_INTERNAL_SOURCE."_AIRBYTE_NORMALIZED_AT","_AIRBYTE_DEDUP_EXCHANGE_RATE_HASHID" = DBT_INTERNAL_SOURCE."_AIRBYTE_DEDUP_EXCHANGE_RATE_HASHID"
    

    when not matched then insert
        ("_AIRBYTE_UNIQUE_KEY", "_AIRBYTE_UNIQUE_KEY_SCD", "ID", "CURRENCY", "DATE", "TIMESTAMP_COL", "HKD@spéçiäl & characters", "HKD_SPECIAL___CHARACTERS", "NZD", "USD", "_AIRBYTE_START_AT", "_AIRBYTE_END_AT", "_AIRBYTE_ACTIVE_ROW", "_AIRBYTE_AB_ID", "_AIRBYTE_EMITTED_AT", "_AIRBYTE_NORMALIZED_AT", "_AIRBYTE_DEDUP_EXCHANGE_RATE_HASHID")
    values
        ("_AIRBYTE_UNIQUE_KEY", "_AIRBYTE_UNIQUE_KEY_SCD", "ID", "CURRENCY", "DATE", "TIMESTAMP_COL", "HKD@spéçiäl & characters", "HKD_SPECIAL___CHARACTERS", "NZD", "USD", "_AIRBYTE_START_AT", "_AIRBYTE_END_AT", "_AIRBYTE_ACTIVE_ROW", "_AIRBYTE_AB_ID", "_AIRBYTE_EMITTED_AT", "_AIRBYTE_NORMALIZED_AT", "_AIRBYTE_DEDUP_EXCHANGE_RATE_HASHID")

;
    commit;
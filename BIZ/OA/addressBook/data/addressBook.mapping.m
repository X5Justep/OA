<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <store name="OA_AB_AddressBook"/>  
  <store name="OA_AB_AddressBookShare"/>  
  <mapping concept="OA_AB_AddressBook">
    <table type="owner-table" name="OA_AB_AddressBook">
      <key field="fID" type="String"/>
    </table>
  </mapping>
  <mapping concept="OA_AB_AddressBookShare">
    <table type="owner-table" name="OA_AB_AddressBookShare">
      <key field="fID" type="String"/>
    </table>
  </mapping>
</model>

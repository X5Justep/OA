<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <!--(DEFPROCESS addressBookPsnListProcess	(FLOW FALSE)
	(LABEL "个人通讯录管理" "zh_CN")
	(HAS-DEFAULT-ACTIONS "/OA/addressBook/data")
	(HAS-ACTION createAddressBookAction "/OA/addressBook/data")
	(HAS-ACTION saveAddressBookAction "/OA/addressBook/data")
	(HAS-ACTION queryAddressBookAction "/OA/addressBook/data")
	(HAS-ACTION createAddressBookShareAction "/OA/addressBook/data")
	(HAS-ACTION saveAddressBookShareAction "/OA/addressBook/data")
	(HAS-ACTION queryAddressBookShareAction "/OA/addressBook/data")
	(HAS-ACTION AddressBookShareQueryAction "/OA/addressBook/data")
	(DEFACTIVITY-STATIC startActivity
		(LABEL "startActivity" "zh_CN")))-->
  <process name="addressBookPsnListProcess">
    <label language="zh_CN">个人通讯录管理</label>
    <has-action action="createAddressBookAction"/>
    <has-action action="saveAddressBookAction"/>
    <has-action action="queryAddressBookAction"/>
    <has-action action="createAddressBookShareAction"/>
    <has-action action="saveAddressBookShareAction"/>
    <has-action action="queryAddressBookShareAction"/>
    <has-action action="AddressBookShareQueryAction"/>
    <static-activity name="startActivity">
      <label language="zh_CN">startActivity</label>
    </static-activity>
  </process>
</model>

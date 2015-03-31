<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryNotReadProcedure" code-model="/OA/email/logic/code" code="Email.queryNotRead"/>  
  <procedure name="sendEmailProcedure" code-model="/OA/email/logic/code" code="Email.sendEmail"> 
    <parameter name="dataJson" type="String"/>
  </procedure> 
</model>

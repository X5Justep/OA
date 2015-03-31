<?xml version="1.0" encoding="utf-8" standalone="no"?><model xmlns="http://www.justep.com/model">  
  <action name="createBKBookInfoAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookInfo"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBKBookInfoAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookInfo"/>  
    <public name="idColumn" type="String" value="OA_BK_BookInfo"/>  
    <private name="select" type="String" value="OA_BK_BookInfo.*"/>  
    <private name="from" type="String" value="OA_BK_BookInfo OA_BK_BookInfo"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  </action>  
  <action name="saveBKBookInfoAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookInfo"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  </action> 
    
    
  
  
  <action name="createBKBookApplyMAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookApplyM"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBKBookApplyMAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookApplyM"/>  
    <public name="idColumn" type="String" value="OA_BK_BookApplyM"/>  
    <private name="select" type="String" value="OA_BK_BookApplyM.*"/>  
    <private name="from" type="String" value="OA_BK_BookApplyM OA_BK_BookApplyM"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  

</action>  
  <action name="saveBKBookApplyMAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookApplyM"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  </action> 
  
  <action name="createBookApplyDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookApplyD"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryBKBookApplyDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookApplyD"/>  
    <public name="idColumn" type="String" value="OA_BK_BookApplyD"/>  
    <private name="select" type="String" value="OA_BK_BookApplyD.*"/>  
    <private name="from" type="String" value="OA_BK_BookApplyD OA_BK_BookApplyD"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  </action>  
  <action name="saveBKBookApplyDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookApplyD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String"/> 
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  </action> 
  
  
  <action name="queryBKBookApplyDetailAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_BK_BookApplyD"/>  
    <public name="idColumn" type="String" value="OA_BK_BookApplyD"/>  
    <private name="select" type="String" value="OA_BK_BookApplyD.*,m.fBizState as fBizState,m.fBizStateName as fBizStateName,m.fCreatePsnID as fCreatePsnID,m.fCreatePsnFID as fCreatePsnFID,m.fCreateTime as fCreateTime,m.fApplyDeptName as fApplyDeptName,m.fApplyPsnID as fApplyPsnID,m.fApplyPsnName as fApplyPsnName,m.fApplyPsnFID as fApplyPsnFID,m.fApplyDate as fApplyDate"/>  
    <private name="from" type="String" value="OA_BK_BookApplyD OA_BK_BookApplyD  optional  join OA_BK_BookApplyM m on OA_BK_BookApplyD.fMasterID = m"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  </action> 
  <action name="queryVBookApplyStatusAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="V_OA_Book_ApplyStatus"/>  
    <public name="idColumn" type="String" value="V_OA_Book_ApplyStatus"/>  
    <private name="select" type="String" value="V_OA_Book_ApplyStatus.*"/>  
    <private name="from" type="String" value="V_OA_Book_ApplyStatus V_OA_Book_ApplyStatus"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/book/data"/> 
  </action> 
  
  <action name="isBookStatusAction" procedure="isBookStatusProcedure"> 
    <public name="bookIDs" type="String"/> 
    <public name="status" type="String"/> 
  </action>  
  <procedure code="Book.isBorrowApplyBook" code-model="/OA/book/logic/code" name="isBookStatusProcedure"> 
    <parameter name="bookIDs" type="String"/>
    <parameter name="status" type="String"/> 
  </procedure> 
  
  <action name="updateBookInfoLoanStatusAction" procedure="updateBookInfoLoanStatusProcedure">
  	<public name="bizID" type="String"/>
  </action>
  <procedure code="Book.updateBookLoanStatus" code-model="/OA/book/logic/code" name="updateBookInfoLoanStatusProcedure"> 
    <parameter name="bizID" type="String"/> 
  </procedure> 
<action global="false" name="AppendBookAction" procedure="AppendBookProcedure"><label language="zh_CN">添加借阅图书</label>
<public name="sBookID" type="String"/>
<public name="sMasterID" type="String"/>
</action>
</model>
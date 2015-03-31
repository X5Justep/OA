<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <!-- OA_AM_Fonds -->  
  <action name="createAMFondsAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_Fonds"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMFondsAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_Fonds"/>  
    <private name="select" type="String" value="OA_AM_Fonds.*"/>  
    <private name="from" type="String" value="OA_AM_Fonds OA_AM_Fonds"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_Fonds"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_AM_Fonds.fFondsNO asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMFondsAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_Fonds"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_Category -->  
  <action name="createAMCategoryAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_Category"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMCategoryAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_Category"/>  
    <private name="select" type="String" value="OA_AM_Category.*"/>  
    <private name="from" type="String" value="OA_AM_Category OA_AM_Category"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_Category"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_AM_Category.fSequence asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMCategoryAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_Category"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_FondsCategory -->  
  <action name="createAMFondsCategoryAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_FondsCategory"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMFondsCategoryAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_FondsCategory"/>  
    <private name="select" type="String" value="OA_AM_FondsCategory.*,c.fCategoryNO as fCategoryNO,c.fCategoryName as fCategoryName"/>  
    <private name="from" type="String" value="OA_AM_FondsCategory OA_AM_FondsCategory optional join OA_AM_Category c on OA_AM_FondsCategory.fCategoryID = c"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_FondsCategory"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_AM_FondsCategory.fFondsID asc"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMFondsCategoryAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_FondsCategory"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String" value="fCategoryNO,fCategoryName"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_Archival -->  
  <action name="createAMArchivalAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_Archival"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMArchivalAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_Archival"/>  
    <private name="select" type="String" value="OA_AM_Archival.*"/>  
    <private name="from" type="String" value="OA_AM_Archival OA_AM_Archival"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_Archival"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_AM_Archival.fArchivalNO"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMArchivalAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_Archival"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_BorrowApplyM -->  
  <action name="createAMBorrowApplyMAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_BorrowApplyM"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMBorrowApplyMAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_BorrowApplyM"/>  
    <private name="select" type="String" value="OA_AM_BorrowApplyM.*"/>  
    <private name="from" type="String" value="OA_AM_BorrowApplyM OA_AM_BorrowApplyM"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_BorrowApplyM"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMBorrowApplyMAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_BorrowApplyM"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_BorrowApplyD -->  
  <action name="createAMBorrowApplyDAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_BorrowApplyD"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMBorrowApplyDAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_BorrowApplyD"/>  
    <private name="select" type="String" value="OA_AM_BorrowApplyD.*"/>  
    <private name="from" type="String" value="OA_AM_BorrowApplyD OA_AM_BorrowApplyD"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_BorrowApplyD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_AM_BorrowApplyD.fArchivalNO"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMBorrowApplyDAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_BorrowApplyD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_DistoryApplyM -->  
  <action name="createAMDistoryApplyMAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_DistoryApplyM"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMDistoryApplyMAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_DistoryApplyM"/>  
    <private name="select" type="String" value="OA_AM_DistoryApplyM.*"/>  
    <private name="from" type="String" value="OA_AM_DistoryApplyM OA_AM_DistoryApplyM"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_DistoryApplyM"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMDistoryApplyMAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_DistoryApplyM"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_DistoryApplyD -->  
  <action name="createAMDistoryApplyDAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_DistoryApplyD"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMDistoryApplyDAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_DistoryApplyD"/>  
    <private name="select" type="String" value="OA_AM_DistoryApplyD.*"/>  
    <private name="from" type="String" value="OA_AM_DistoryApplyD OA_AM_DistoryApplyD"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_DistoryApplyD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="OA_AM_DistoryApplyD.fArchivalNO"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMDistoryApplyDAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_DistoryApplyD"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- OA_AM_History -->  
  <action name="createAMHistoryAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="OA_AM_History"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/> 
  </action>  
  <action name="queryAMHistoryAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_History"/>  
    <private name="select" type="String" value="OA_AM_History.*"/>  
    <private name="from" type="String" value="OA_AM_History OA_AM_History"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_History"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveAMHistoryAction" procedure="bizSaveProcedure"> 
    <private name="concept" type="String" value="OA_AM_History"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <!-- Query -->  
  <action name="queryAMBorrowApplyDWithArchivalAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_BorrowApplyD"/>  
    <private name="select" type="String" value="OA_AM_BorrowApplyD.*,a.fArchivalNO as fArchivalNO,a.fAMYear as fAMYear,a.fTitle as fTitle,a.fFileDeptName as fFileDeptName,a.fResponsibleName as fResponsibleName,a.fCarry as fCarry,a.fState as fState,a.fSign as fSign,a.fIsRoll as fIsRoll,a.fInventory as fInventory"/>  
    <private name="from" type="String" value="OA_AM_BorrowApplyD OA_AM_BorrowApplyD optional  join OA_AM_Archival a on OA_AM_BorrowApplyD.fArchivalID  =  a"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_BorrowApplyD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="queryAMDistoryApplyDWithArchivalAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_DistoryApplyD"/>  
    <private name="select" type="String" value="OA_AM_DistoryApplyD.*,a.fArchivalNO as fArchivalNO,a.fTitle as fTitle,a.fFileDeptName as fFileDeptName,a.fResponsibleName as fResponsibleName,a.fCarry as fCarry,a.fState as fState,a.fSign as fSign,a.fIsRoll as fIsRoll"/>  
    <private name="from" type="String" value="OA_AM_DistoryApplyD OA_AM_DistoryApplyD optional  join OA_AM_Archival a on OA_AM_DistoryApplyD.fArchivalID  =  a"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_DistoryApplyD"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="queryAMHistoryWithArchivalAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="OA_AM_History"/>  
    <private name="select" type="String" value="OA_AM_History.*,a.fFileNO as fFileNO,a.fArchivalNO as fArchivalNO,a.fTitle as fTitle,a.fCarry as fCarry,a.fState as fState,a.fSign as fSign,a.fIsRoll as fIsRoll,a.fAMYear as fAMYear,a.fSecret as fSecret,a.fFileDeptID as fFileDeptID,a.fFileDeptName as fFileDeptName,a.fResponsibleID as fResponsibleID,a.fResponsibleName as fResponsibleName,a.fKeepLimit as fKeepLimit,a.fAMDate as fAMDate,a.fFileDate as fFileDate"/>  
    <private name="from" type="String" value="OA_AM_History OA_AM_History optional  join OA_AM_Archival a on OA_AM_History.fArchivalID = a"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_History"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <!-- V_OA_AM_CategorySelect -->  
  <action name="queryVAMCategorySelectAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="V_OA_AM_CategorySelect"/>  
    <private name="select" type="String" value="V_OA_AM_CategorySelect.*"/>  
    <private name="from" type="String" value="V_OA_AM_CategorySelect V_OA_AM_CategorySelect"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_AM_CategorySelect"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <!-- V_OA_AM_FiledCheck -->  
  <action name="queryVAMFiledCheckAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="V_OA_AM_FiledCheck"/>  
    <private name="select" type="String" value="V_OA_AM_FiledCheck.*"/>  
    <private name="from" type="String" value="V_OA_AM_FiledCheck V_OA_AM_FiledCheck"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="V_OA_AM_FiledCheck"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <!-- actions -->  
  <action name="archivalInterfaceAction" procedure="ArchivalInterfaceProcedure"> 
    <public name="archivalInfo" type="Xml"/> 
  </action>  
  <procedure code="Archival.archivalInterface" code-model="/OA/archival/logic/code"
    name="ArchivalInterfaceProcedure"> 
    <parameter name="archivalInfo" type="Xml"/> 
  </procedure>  
  <action name="buildUpAction" procedure="BuildUpProcedure"> 
    <public name="filedIDs" type="String"/>  
    <public name="rollID" type="String"/> 
  </action>  
  <procedure code="Archival.archivalBuildUp" code-model="/OA/archival/logic/code"
    name="BuildUpProcedure"> 
    <parameter name="filedIDs" type="String"/>  
    <parameter name="rollID" type="String"/> 
  </procedure>  
  <procedure code="Archival.checkDistoryClose" code-model="/OA/archival/logic/code"
    name="CheckDistoryCloseProcedure"> 
    <parameter name="fArchivalID" type="String"/> 
  </procedure>  
  <action name="returnArchivalAction" procedure="returnArchivalProcedure"> 
    <public name="fArchivalID" type="String"/>  
    <public name="fReturnNum" type="String"/> 
  </action>  
  <procedure code="Archival.returnArchival" code-model="/OA/archival/logic/code"
    name="returnArchivalProcedure"> 
    <parameter name="fArchivalID" type="String"/>  
    <parameter name="fReturnNum" type="String"/> 
  </procedure>  
  <action name="deleteRollAction" procedure="deleteRollProcedure"> 
    <public name="filedIDs" type="String"/> 
  </action>  
  <procedure code="Archival.deleteRoll" code-model="/OA/archival/logic/code" name="deleteRollProcedure"> 
    <parameter name="filedIDs" type="String"/> 
  </procedure>  
  <action name="deleteArchivalAction" procedure="DeleteArchivalProcedure"> 
    <public name="filedIDs" type="String"/> 
  </action>  
  <procedure code="Archival.deleteArchival" code-model="/OA/archival/logic/code"
    name="DeleteArchivalProcedure"> 
    <parameter name="filedIDs" type="String"/> 
  </procedure>  
  <action name="rollSubmitAction" procedure="rollSubmitProcedure"> 
    <public name="filedIDs" type="String"/>  
    <public name="filedInfo" type="String"/>  
    <public name="hasChildren" type="String"/> 
  </action>  
  <procedure code="Archival.rollSubmit" code-model="/OA/archival/logic/code" name="rollSubmitProcedure"> 
    <parameter name="filedIDs" type="String"/>  
    <parameter name="filedInfo" type="String"/>  
    <parameter name="hasChildren" type="String"/> 
  </procedure>  
  <action name="fileSubmitAction" procedure="fileSubmitProcedure"> 
    <public name="filedIDs" type="String"/>  
    <public name="filedInfo" type="String"/> 
  </action>  
  <procedure code="Archival.fileSubmit" code-model="/OA/archival/logic/code" name="fileSubmitProcedure"> 
    <parameter name="filedIDs" type="String"/>  
    <parameter name="filedInfo" type="String"/> 
  </procedure>  
  <action name="generateArchivalInfoAction" procedure="GenerateArchivalInfoProcedure"> 
    <public name="infoIDs" type="String"/>  
    <public name="infoType" type="String"/> 
  </action>  
  <procedure code="Archival.generateArchivalInfo" code-model="/OA/archival/logic/code"
    name="GenerateArchivalInfoProcedure"> 
    <parameter name="infoIDs" type="String"/>  
    <parameter name="infoType" type="String"/> 
  </procedure>  
  <action name="rollChangeAction" procedure="RollChangeProcedure"> 
    <public name="rollID" type="String"/>  
    <public name="infoType" type="String"/> 
  </action>  
  <procedure code="Archival.rollChange" code-model="/OA/archival/logic/code" name="RollChangeProcedure"> 
    <parameter name="rollID" type="String"/>  
    <parameter name="infoType" type="String"/> 
  </procedure>  
  <action name="getDistoryInfoAction" procedure="GetDistoryInfoProcedure"> 
    <public name="fArchivalID" type="String"/> 
  </action>  
  <procedure code="Archival.getDistoryInfo" code-model="/OA/archival/logic/code"
    name="GetDistoryInfoProcedure"> 
    <parameter name="fArchivalID" type="String"/> 
  </procedure>  
  <action name="getBorrowInfoAction" procedure="GetBorrowInfoProcedure"> 
    <public name="fArchivalID" type="String"/> 
  </action>  
  <procedure code="Archival.getBorrowInfo" code-model="/OA/archival/logic/code" name="GetBorrowInfoProcedure"> 
    <parameter name="fArchivalID" type="String"/> 
  </procedure>  
  <action name="getNodeInfoAction" procedure="GetNodeInfoProcedure"> 
    <public name="parentID" type="String"/>  
    <public name="type" type="String"/>  
    <public name="URL" type="String"/> 
  </action>  
  <procedure code="Archival.getNodeInfo" code-model="/OA/archival/logic/code" name="GetNodeInfoProcedure"> 
    <parameter name="parentID" type="String"/>  
    <parameter name="type" type="String"/>  
    <parameter name="URL" type="String"/> 
  </procedure>   
  <action name="filedArchivalAction" procedure="filedArchivalProcedure"> 
    <public name="rollIDs" type="String"/>  
    <public name="fileIDs" type="String"/>  
    <public name="filedInfo" type="String"/>  
    <public name="hasChildren" type="String"/> 
  </action>  
  <procedure code="Archival.filedArchival" code-model="/OA/archival/logic/code" name="filedArchivalProcedure"> 
    <parameter name="rollIDs" type="String"/>  
    <parameter name="fileIDs" type="String"/>  
    <parameter name="filedInfo" type="String"/>  
    <parameter name="hasChildren" type="String"/> 
  </procedure>  
  <action name="shiftOutAction" procedure="ShiftOutProcedure"> 
    <public name="filedIDs" type="String"/> 
  </action>  
  <procedure code="Archival.archivalShiftOut" code-model="/OA/archival/logic/code"
    name="ShiftOutProcedure"> 
    <parameter name="filedIDs" type="String"/> 
  </procedure>  
  <action name="canDelCategoryAction" procedure="CanDelCategoryProcedure"> 
    <public name="categoryID" type="String"/> 
  </action>  
  <procedure code="Archival.canDelCategory" code-model="/OA/archival/logic/code"
    name="CanDelCategoryProcedure"> 
    <parameter name="categoryID" type="String"/> 
  </procedure>  
  <action name="queryOA_AM_ExcelTempAction" procedure="bizQueryProcedure">
     <private name="concept" type="String" value="OA_AM_ExcelTemp"/>  
    <private name="select" type="String" value="OA_AM_ExcelTemp.*"/>  
    <private name="from" type="String" value="OA_AM_ExcelTemp OA_AM_ExcelTemp"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="OA_AM_ExcelTemp"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action name="saveOA_AM_ExcelTempAction" procedure="bizSaveProcedure">
     <private name="concept" type="String" value="OA_AM_ExcelTemp"/>  
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/archival/data"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" required="true" type="Table"/> 
  </action>  
  <action name="createOA_AM_ExcelTempAction" procedure="bizCreateProcedure">
    <private name="concept" type="String" value="OA_AM_ExcelTemp"/>  
    <private name="fnModel" type="String"/>  
    <public name="table" required="true" type="Table"/>  
    <public name="defaultValues" type="Map"/>  
  </action>  
  <action name="rollExcelImportAction" procedure="rollExcelImportProcedure"> 
    <public name="fSeparate" type="String"/> 
  </action>  
  <procedure code="Archival.rollExcelImport" code-model="/OA/archival/logic/code"
    name="rollExcelImportProcedure"> 
    <parameter name="fSeparate" type="String"/> 
  </procedure> 
  <action name="fileExcelImportAction" procedure="fileExcelImportProcedure"> 
    <public name="fSeparate" type="String"/> 
  </action>  
  <procedure code="Archival.fileExcelImport" code-model="/OA/archival/logic/code"
    name="fileExcelImportProcedure"> 
    <parameter name="fSeparate" type="String"/> 
  </procedure> 
  <action name="setCategroyURLAction" procedure="setCategroyURLProcedure"> 
    <public name="url" type="String"/> 
  </action>  
  <procedure code="Archival.setCategroyURL" code-model="/OA/archival/logic/code"
    name="setCategroyURLProcedure"> 
    <parameter name="url" type="String"/> 
  </procedure> 
  <action name="repairCategroyURLNameAction" procedure="repairCategroyURLNameProcedure"> 
  </action>  
  <procedure code="Archival.repairCategroyURLName" code-model="/OA/archival/logic/code"
    name="repairCategroyURLNameProcedure"> 
  </procedure> 
  <action name="updateRollORFileAction" procedure="updateRollORFileProcedure"> 
    <public name="fOldCategoryID" type="String"/> 
    <public name="fCategoryID" type="String"/> 
  </action>  
  <procedure code="Archival.updateRollORFile" code-model="/OA/archival/logic/code"
    name="updateRollORFileProcedure"> 
    <parameter name="fOldCategoryID" type="String"/> 
    <parameter name="fCategoryID" type="String"/> 
  </procedure> 
</model>

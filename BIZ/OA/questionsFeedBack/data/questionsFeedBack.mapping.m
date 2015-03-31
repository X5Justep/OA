<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">

<store name="OA_QB_Execute"/>
<store name="OA_QB_Modules"/>
<store name="OA_QB_QuestionsFeedBack"/><mapping concept="OA_QB_Execute"><table name="OA_PUB_Execute" type="owner-table"><key field="fID" type="String"/>
<discriminator field="fBizKind" value="问题反馈"/>
</table>
</mapping>

</model>
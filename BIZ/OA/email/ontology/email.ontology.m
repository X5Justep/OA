<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="OA_EM_SendEmail" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">发件箱</label>
<has-relation relation="fEmailName" data-type="String" size="200"><label language="zh_CN">邮件主题</label>
</has-relation>
<has-relation relation="fConsignee" data-type="Text"><label language="zh_CN">收件人名称</label>
</has-relation>
<has-relation relation="fText" data-type="Text"><label language="zh_CN">正文</label>
</has-relation>
<has-relation relation="fState" data-type="String"><label language="zh_CN">发送状态</label>
</has-relation>
<has-relation relation="fConsigneeID" data-type="Text"><label language="zh_CN">收件人id</label>
</has-relation>
<has-relation relation="fConsigneeCode" data-type="Text"><label language="zh_CN">收件人编码</label>
</has-relation>
<has-relation relation="fFJID" data-type="String" size="4000"><label language="zh_CN">附件ID</label>
</has-relation>
<has-relation relation="fSendPerName" default-value-expr="currentPersonName()"><label language="zh_CN">发送人名称</label>
</has-relation>
<has-relation relation="fSendPerID" default-value-expr="currentPersonID()"><label language="zh_CN">发送人ID</label>
</has-relation>
<has-relation relation="fCreattime" data-type="DateTime" default-value-expr="currentDateTime()"><label language="zh_CN">创建时间</label>
</has-relation>
<has-relation relation="fSendTime" data-type="DateTime"><label language="zh_CN">发送时间</label>
</has-relation>
<has-relation relation="fSendPerCode" data-type="String" default-value-expr="currentPersonCode()"><label language="zh_CN">发件人编码</label>
</has-relation>
</concept>
<relation name="fEmailName" data-type="String"><label language="zh_CN">邮件主题</label>
</relation>
<relation name="fConsignee" data-type="Text"><label language="zh_CN">收件人名称</label>
</relation>
<relation name="fText" data-type="Text"><label language="zh_CN">正文</label>
</relation>
<relation name="fState" data-type="String"><label language="zh_CN">发送状态</label>
</relation>
<relation name="fConsigneeID" data-type="Text"><label language="zh_CN">收件人id</label>
</relation>
<relation name="fConsigneeCode" data-type="Text"><label language="zh_CN">收件人编码</label>
</relation>
<concept name="OA_EM_ReceiveEmail" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">收件箱</label>
<has-relation relation="fEmailName"><label language="zh_CN">邮件主题</label>
</has-relation>
<has-relation relation="fText"><label language="zh_CN">正文</label>
</has-relation>
<has-relation relation="fFJID" size="4000"><label language="zh_CN">附件ID</label>
</has-relation>
<has-relation relation="fSendPerName" data-type="String"><label language="zh_CN">发送人名称</label>
</has-relation>
<has-relation relation="fSendPerID" data-type="String"><label language="zh_CN">发送人ID</label>
</has-relation>
<has-relation relation="fReplyState" data-type="String"><label language="zh_CN">回复状态</label>
</has-relation>
<has-relation relation="fQurey" data-type="String"><label language="zh_CN">查看状态</label>
</has-relation>
<has-relation relation="fConsignee" data-type="String"><label language="zh_CN">收件人名称</label>
</has-relation>
<has-relation relation="fConsigneeID" data-type="String"><label language="zh_CN">收件人id</label>
</has-relation>
<has-relation relation="fConsigneeCode" data-type="String"><label language="zh_CN">收件人编码</label>
</has-relation>
<has-relation relation="fSendTime"><label language="zh_CN">发送时间</label>
</has-relation>
<has-relation relation="fSendPerCode"><label language="zh_CN">发件人编码</label>
</has-relation>
</concept>
<relation name="fFJID" data-type="String"><label language="zh_CN">附件ID</label>
</relation>
<relation name="fSendPerName" data-type="Text"><label language="zh_CN">发送人名称</label>
</relation>
<relation name="fSendPerID" data-type="String"><label language="zh_CN">发送人ID</label>
</relation>
<relation name="fReplyState" data-type="String"><label language="zh_CN">回复状态</label>
</relation>
<relation name="fQurey" data-type="String"><label language="zh_CN">查看状态</label>
</relation>
<relation name="fCreattime" data-type="DateTime"><label language="zh_CN">创建时间</label>
</relation>
<relation name="fSendTime" data-type="DateTime"><label language="zh_CN">发送时间</label>
</relation>
<relation name="fSendPerCode" data-type="String"><label language="zh_CN">发件人编码</label>
</relation>
<concept name="v_rosebyperson" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">人员拥有角色</label>
<has-relation relation="sorgname" data-type="String"><label language="zh_CN">人员名称</label>
</has-relation>
<has-relation relation="scode" data-type="String"><label language="zh_CN">角色编码</label>
</has-relation>
<has-relation relation="sname" data-type="String"><label language="zh_CN">角色名称</label>
</has-relation>
</concept>
<relation name="sorgname" data-type="String"><label language="zh_CN">人员名称</label>
</relation>
<relation name="scode" data-type="String"><label language="zh_CN">角色编码</label>
</relation>
<relation name="sname" data-type="String"><label language="zh_CN">角色名称</label>
</relation>
<concept name="OA_RTX_Base" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">RTX提醒设置</label>
<has-relation relation="fPersonID" data-type="String"><label language="zh_CN">人员ID</label>
</has-relation>
<has-relation relation="fPersonName" data-type="String"><label language="zh_CN">人员姓名</label>
</has-relation>
<has-relation relation="fIsMessage" data-type="Integer"><label language="zh_CN">是否提醒</label>
</has-relation>
</concept>
<relation name="fPersonID" data-type="String"><label language="zh_CN">人员ID</label>
</relation>
<relation name="fPersonName" data-type="String"><label language="zh_CN">人员姓名</label>
</relation>
<relation name="fIsMessage" data-type="Integer"><label language="zh_CN">是否提醒</label>
</relation>
</model>
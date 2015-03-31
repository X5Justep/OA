<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/car/process/carUseApply/carArrangeActivity.w" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <rule xid="rule1_5" xui:parent="dCarUseApply" xui:update-mode="insert" >
<readonly xid="readonly1_5" >
<expr xid="default1_5" >
true</expr>
</readonly>
</rule>
    <rule xid="rule2_5" xui:parent="dCarUseArrange" xui:update-mode="insert" >
<readonly xid="readonly2_5" >
<expr xid="default2_5" >
true</expr>
</readonly>
</rule>

</div>
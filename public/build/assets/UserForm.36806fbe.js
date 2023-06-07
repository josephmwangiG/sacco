import{o as l,l as r,b as e,t as a,d as u,f as n,v as m,p as i,g as f,F as h,m as v}from"./app.7d06a11a.js";const b={class:"modal fade",id:"formModal",tabindex:"-1",role:"dialog","aria-labelledby":"formModal","aria-hidden":"true"},y={class:"modal-dialog modal-md",role:"document"},g={class:"modal-content"},_={class:"modal-header"},x={class:"modal-title",id:"formModal"},k=e("button",{type:"button",class:"close","data-dismiss":"modal","aria-label":"Close"},[e("span",{"aria-hidden":"true"},"\xD7")],-1),M={class:"modal-body modal-div"},N={class:"new-user-info"},U={class:"row"},p={class:"form-group col-md-6"},S=e("label",{for:"first_name"},"First Name:",-1),V={key:0,class:"text-danger"},E={class:"form-group col-md-6"},F=e("label",{for:"last_name"},"Last Name:",-1),q={key:0,class:"text-danger"},B={class:"form-group col-md-6"},w=e("label",{for:"email"},"Email Address:",-1),C={key:0,class:"text-danger"},L={class:"form-group col-md-6"},j=e("label",{for:"phone"},"Phone Number:",-1),A={key:0,class:"text-danger"},D={class:"form-group col-md-12"},I=e("label",{for:"role"},"Role:",-1),O=["value"],P={key:0,class:"text-danger"},R={class:"modal-footer"},T=e("button",{type:"button",id:"closeModal",class:"btn btn-secondary","data-dismiss":"modal"}," Close ",-1),$={type:"submit",class:"btn btn-primary"},H={name:"UserForm",props:{form:Object,action:String,roles:Object,item:Number},setup(o){const d=o;function c(){d.action=="Edit"?d.form.put(route("users.update",d.item),{onSuccess:()=>{d.form.reset(),document.getElementById("closeModal").click()}}):d.form.post(route("users.store"),{onSuccess:()=>{d.form.reset(),document.getElementById("closeModal").click()}})}return(z,s)=>(l(),r("div",b,[e("div",y,[e("div",g,[e("div",_,[e("h5",x,a(o.action)+" User",1),k]),e("form",{onSubmit:s[5]||(s[5]=u(t=>c(),["prevent"]))},[e("div",M,[e("div",N,[e("div",U,[e("div",p,[S,n(e("input",{type:"text","onUpdate:modelValue":s[0]||(s[0]=t=>o.form.first_name=t),class:"form-control",required:"",id:"first_name",placeholder:"First Name"},null,512),[[m,o.form.first_name]]),o.form.errors.first_name?(l(),r("div",V,[e("small",null,a(o.form.errors.first_name),1)])):i("",!0)]),e("div",E,[F,n(e("input",{type:"text","onUpdate:modelValue":s[1]||(s[1]=t=>o.form.last_name=t),class:"form-control",required:"",id:"last_name",placeholder:"Last Name"},null,512),[[m,o.form.last_name]]),o.form.errors.last_name?(l(),r("div",q,[e("small",null,a(o.form.errors.last_name),1)])):i("",!0)]),e("div",B,[w,n(e("input",{type:"email","onUpdate:modelValue":s[2]||(s[2]=t=>o.form.email=t),class:"form-control",required:"",id:"email",placeholder:"Email Address"},null,512),[[m,o.form.email]]),o.form.errors.phone?(l(),r("div",C,[e("small",null,a(o.form.errors.phone),1)])):i("",!0)]),e("div",L,[j,n(e("input",{type:"phone","onUpdate:modelValue":s[3]||(s[3]=t=>o.form.phone=t),class:"form-control",required:"",id:"phone",placeholder:"Phone Number"},null,512),[[m,o.form.phone]]),o.form.errors.phone?(l(),r("div",A,[e("small",null,a(o.form.errors.phone),1)])):i("",!0)]),e("div",D,[I,n(e("select",{type:"text","onUpdate:modelValue":s[4]||(s[4]=t=>o.form.role_id=t),class:"form-control",required:"",id:"name",placeholder:"Select Role"},[(l(!0),r(h,null,v(o.roles,t=>(l(),r("option",{key:t.id,value:t.id},a(t.name),9,O))),128))],512),[[f,o.form.role_id]]),o.form.errors.role_id?(l(),r("div",P,[e("small",null,a(o.form.errors.role_id),1)])):i("",!0)])])])]),e("div",R,[T,e("button",$,a(o.action)+" User ",1)])],32)])])]))}};export{H as default};

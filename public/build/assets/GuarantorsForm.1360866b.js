import{j as b,o as a,l as n,b as e,t as l,d as g,f as d,g as h,F as _,m as y,e as x,p as m,v as u}from"./app.dc7518d1.js";const p={class:"modal fade",id:"formModal",tabindex:"-1",role:"dialog","aria-labelledby":"formModal","aria-hidden":"true"},M={class:"modal-dialog modal-lg",role:"document"},k={class:"modal-content"},N={class:"modal-header"},S={class:"modal-title",id:"formModal"},V=e("button",{type:"button",class:"close","data-dismiss":"modal","aria-label":"Close"},[e("span",{"aria-hidden":"true"},"\xD7")],-1),A={class:"modal-body modal-div"},C={class:"new-user-info"},E={class:"row"},F={class:"form-group col-sm-6"},w=e("label",{for:"member"},"Member:",-1),B=e("option",{value:""},"Select option",-1),I=["value"],U={key:0,class:"text-danger"},G={class:"form-group col-md-6"},T=e("label",{for:"account_number"},"Ac Number:",-1),j={key:0,class:"text-danger"},q={class:"form-group col-md-6"},D=e("label",{for:"id_number"},"National Id:",-1),L={key:0,class:"text-danger"},O={class:"form-group col-md-6"},P=e("label",{for:"guarantee_amount"},"Guarantee Amount:",-1),$={key:0,class:"text-danger"},z={class:"form-group col-md-12"},H={class:"form-group"},J=e("label",{for:"exampleFormControlTextarea1"},"Notes",-1),K={key:0,class:"text-danger"},Q=e("div",{class:"modal-footer"},[e("button",{type:"button",id:"closeModal",class:"btn btn-secondary","data-dismiss":"modal"}," Close ")],-1),X={name:"GuarantorsForm",props:{form:Object,action:String,item:Number,id:Number},emits:["getItems"],setup(o,{emit:R}){const s=o;b().props.value.paymentMethods;const c=b().props.value.members,f=i=>{c.forEach(t=>{t.id==i.target.value&&(s.form.id_number=t.id_number,s.form.account_number=t.account.account_number)})};s.action=="Edit"&&f({target:{value:form.member}});function v(){s.action=="Edit"?s.form.put(route("loanApplications.update.guarantors",s.item),{onSuccess:i=>{s.form.reset(),document.getElementById("closeModal").click()}}):s.form.post(route("loanApplications.store.guarantors",s.id),{onSuccess:i=>{s.form.reset(),document.getElementById("closeModal").click()}})}return(i,t)=>(a(),n("div",p,[e("div",M,[e("div",k,[e("div",N,[e("h5",S,l(o.action)+" Guarantor.",1),V]),e("form",{onSubmit:t[6]||(t[6]=g(r=>v(),["prevent"]))},[e("div",A,[e("div",C,[e("div",E,[e("div",F,[w,d(e("select",{required:"",onChange:t[0]||(t[0]=r=>f(r)),"onUpdate:modelValue":t[1]||(t[1]=r=>o.form.member=r),class:"form-control",id:"member"},[B,(a(!0),n(_,null,y(x(c),r=>(a(),n("option",{key:r.id,value:r.id},l(r.first_name)+" "+l(r.last_name),9,I))),128))],544),[[h,o.form.member]]),o.form.errors.member?(a(),n("div",U,[e("small",null,l(o.form.errors.member),1)])):m("",!0)]),e("div",G,[T,d(e("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":t[2]||(t[2]=r=>o.form.account_number=r),id:"account_number",placeholder:"Ac Number"},null,512),[[u,o.form.account_number]]),o.form.errors.account_number?(a(),n("div",j,[e("small",null,l(o.form.errors.account_number),1)])):m("",!0)]),e("div",q,[D,d(e("input",{type:"text",class:"form-control",id:"id_number","onUpdate:modelValue":t[3]||(t[3]=r=>o.form.id_number=r),placeholder:"National Id"},null,512),[[u,o.form.id_number]]),o.form.errors.id_number?(a(),n("div",L,[e("small",null,l(o.form.errors.id_number),1)])):m("",!0)]),e("div",O,[P,d(e("input",{type:"text",class:"form-control",id:"guarantee_amount","onUpdate:modelValue":t[4]||(t[4]=r=>o.form.guarantee_amount=r),placeholder:"Guarantee Amount"},null,512),[[u,o.form.guarantee_amount]]),o.form.errors.guarantee_amount?(a(),n("div",$,[e("small",null,l(o.form.errors.guarantee_amount),1)])):m("",!0)]),e("div",z,[e("div",H,[J,d(e("textarea",{class:"form-control","onUpdate:modelValue":t[5]||(t[5]=r=>o.form.notes=r),placeholder:"Short notes",id:"exampleFormControlTextarea1",rows:"4"},null,512),[[u,o.form.notes]]),o.form.errors.notes?(a(),n("div",K,[e("small",null,l(o.form.errors.notes),1)])):m("",!0)])])])])]),Q],32)])])]))}};export{X as default};
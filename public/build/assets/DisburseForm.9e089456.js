import{r as f,u as v,j as k,o as r,c as g,w as q,b as e,f as i,v as m,e as t,l,t as d,p as u,g as y,m as A,F as x,z as B,d as D}from"./app.8c14ce0c.js";import V from"./EditApplication.8a276ab7.js";const w={class:"row"},C={class:"form-group col-md-6"},N=e("label",{for:"disbursement_date"},"Disbursement Date:",-1),M={key:0,class:"text-danger"},U={class:"form-group col-sm-6"},F=e("label",{for:"disburse_method"},"Payment Method:",-1),S=e("option",{value:""},"Select option",-1),E=["value"],L={key:0,class:"text-danger"},j={class:"form-group col-md-6"},z=e("label",{for:"bank_name"},"Bank Name:",-1),I={key:0,class:"text-danger"},P={class:"form-group col-md-6"},$=e("label",{for:"bank_branch"},"Bank branch:",-1),O={key:0,class:"text-danger"},T={class:"form-group col-md-6"},G=e("label",{for:"cheque_date"},"Cheque Date:",-1),H={key:0,class:"text-danger"},J={class:"form-group col-md-6"},K=e("label",{for:"cheque_number"},"Cheque Number:",-1),Q={key:0,class:"text-danger"},R={class:"row"},W={class:"form-group col-md-12"},X={class:"form-group"},Y=e("label",{for:"disburse_note"},"Disbursement Note",-1),Z={key:0,class:"text-danger"},te={name:"DisburseForm",props:{loanApplication:Object},setup(_){const n=_;let s=f(v({disburse_method:n.loanApplication.disburse_method_id,disburse_note:n.loanApplication.disburse_note,mpesa_number:n.loanApplication.mpesa_number,mpesa_first_name:n.loanApplication.mpesa_first_name,mpesa_middle_name:n.loanApplication.mpesa_middle_name,mpesa_last_name:n.loanApplication.mpesa_last_name,cheque_number:n.loanApplication.cheque_number,bank_name:n.loanApplication.bank_name,bank_branch:n.loanApplication.bank_branch,cheque_date:n.loanApplication.cheque_date,disbursement_date:n.loanApplication.disbursement_date}));const p=k().props.value.paymentMethods,b=c=>{c.target.value=="1"?document.getElementById("bank_div").classList.remove("collapse"):document.getElementById("bank_div").classList.add("collapse")};function h(){s.value.put(route("loanApplications.update.disbusement",n.loanApplication.id),{onSuccess:()=>{}})}return(c,a)=>(r(),g(V,{loanApplication:_.loanApplication,active:"disbursement"},{default:q(()=>[e("form",{onSubmit:a[8]||(a[8]=D(o=>h(),["prevent"]))},[e("div",w,[e("div",C,[N,i(e("input",{type:"date",class:"form-control",id:"disbursement_date","onUpdate:modelValue":a[0]||(a[0]=o=>t(s).disbursement_date=o),placeholder:"Bank Branch"},null,512),[[m,t(s).disbursement_date]]),t(s).errors.disbursement_date?(r(),l("div",M,[e("small",null,d(t(s).errors.disbursement_date),1)])):u("",!0)]),e("div",U,[F,i(e("select",{required:"","onUpdate:modelValue":a[1]||(a[1]=o=>t(s).disburse_method=o),class:"form-control",onChange:a[2]||(a[2]=o=>b(o)),id:"disburse_method"},[S,(r(!0),l(x,null,A(t(p),o=>(r(),l("option",{key:o.id,value:o.id},d(o.name),9,E))),128))],544),[[y,t(s).disburse_method]]),t(s).errors.disburse_method?(r(),l("div",L,[e("small",null,d(t(s).errors.disburse_method),1)])):u("",!0)])]),e("div",{class:B(["row",t(s).disburse_method=="1"?"":"collapse"]),id:"bank_div"},[e("div",j,[z,i(e("input",{type:"text",class:"form-control",id:"bank_name","onUpdate:modelValue":a[3]||(a[3]=o=>t(s).bank_name=o),placeholder:"Bank Name"},null,512),[[m,t(s).bank_name]]),t(s).errors.bank_name?(r(),l("div",I,[e("small",null,d(t(s).errors.bank_name),1)])):u("",!0)]),e("div",P,[$,i(e("input",{type:"text",class:"form-control",id:"bank_branch","onUpdate:modelValue":a[4]||(a[4]=o=>t(s).bank_branch=o),placeholder:"Bank Branch"},null,512),[[m,t(s).bank_branch]]),t(s).errors.bank_branch?(r(),l("div",O,[e("small",null,d(t(s).errors.bank_branch),1)])):u("",!0)]),e("div",T,[G,i(e("input",{type:"date",class:"form-control",id:"cheque_date","onUpdate:modelValue":a[5]||(a[5]=o=>t(s).cheque_date=o),placeholder:"Cheque Date"},null,512),[[m,t(s).cheque_date]]),t(s).errors.cheque_date?(r(),l("div",H,[e("small",null,d(t(s).errors.cheque_date),1)])):u("",!0)]),e("div",J,[K,i(e("input",{type:"text",class:"form-control",id:"cheque_number","onUpdate:modelValue":a[6]||(a[6]=o=>t(s).cheque_number=o),placeholder:"Cheque Number"},null,512),[[m,t(s).cheque_number]]),t(s).errors.cheque_number?(r(),l("div",Q,[e("small",null,d(t(s).errors.cheque_number),1)])):u("",!0)])],2),e("div",R,[e("div",W,[e("div",X,[Y,i(e("textarea",{class:"form-control","onUpdate:modelValue":a[7]||(a[7]=o=>t(s).disburse_note=o),placeholder:"Disbursement Note",id:"disburse_note",rows:"4"},null,512),[[m,t(s).disburse_note]]),t(s).errors.disburse_note?(r(),l("div",Z,[e("small",null,d(t(s).errors.disburse_note),1)])):u("",!0)])])])],32)]),_:1},8,["loanApplication"]))}};export{te as default};

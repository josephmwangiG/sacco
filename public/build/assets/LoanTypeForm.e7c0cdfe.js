import{j as u,o as s,l as n,b as e,t as l,d as q,f as a,v as m,p as i,g as c,F as f,m as y,e as v}from"./app.7d06a11a.js";const x={class:"modal fade",id:"formModal",tabindex:"-1",role:"dialog","aria-labelledby":"formModal","aria-hidden":"true"},k={class:"modal-dialog modal-lg",role:"document"},T={class:"modal-content"},V={class:"modal-header"},F={class:"modal-title",id:"formModal"},S=e("button",{type:"button",class:"close","data-dismiss":"modal","aria-label":"Close"},[e("span",{"aria-hidden":"true"},"\xD7")],-1),M={class:"modal-body modal-div"},U={class:"new-user-info"},P={class:"row"},I={class:"form-group col-md-6"},L=e("label",{for:"name"},"Loan Type:",-1),w={key:0,class:"text-danger"},B={class:"form-group col-md-6"},C=e("label",{for:"interest_rate"},"Interest Rate:",-1),D={key:0,class:"text-danger"},E={class:"form-group col-sm-6"},R=e("label",{for:"interest_duration"},"Interest Duration:",-1),N=e("option",{value:""},"Select option",-1),j=e("option",{value:"Year"},"Per Year",-1),Y=e("option",{value:"Month"},"Per Month",-1),O=[N,j,Y],$={key:0,class:"text-danger"},z={class:"form-group col-sm-6"},A=e("label",{for:"interest_type"},"Interest Type:",-1),G=e("option",{value:""},"Select option",-1),H=["value"],J={key:0,class:"text-danger"},K={class:"form-group col-sm-6"},Q=e("label",{for:"payment_frequency"},"Payment Frequency:",-1),W=e("option",{value:""},"Select option",-1),X=["value"],Z={key:0,class:"text-danger"},ee={class:"form-group col-sm-6"},te=e("label",{for:"penalty_type"},"Penalty Type:",-1),oe=e("option",{value:""},"Select option",-1),re=["value"],se={key:0,class:"text-danger"},ne={class:"form-group col-sm-6"},le=e("label",{for:"penalty_frequency"},"Penalty Frequency:",-1),ae=e("option",{value:""},"Select option",-1),ie=["value"],de={key:0,class:"text-danger"},me={class:"form-group col-md-6"},ce=e("label",{for:"penalty_value"},"Penalty Value:",-1),ue={key:0,class:"text-danger"},fe={class:"form-group col-md-6"},ye=e("label",{for:"service_fee"},"Serveice Fee:",-1),ve={key:0,class:"text-danger"},pe={class:"form-group col-md-6"},_e=e("label",{for:"repayment_period"},"Repayment Period:",-1),he={key:0,class:"text-danger"},ge={class:"form-group col-md-12"},be={class:"form-group"},qe=e("label",{for:"exampleFormControlTextarea1"},"Description",-1),xe={key:0,class:"text-danger"},ke={class:"modal-footer"},Te=e("button",{type:"button",id:"closeModal",class:"btn btn-secondary","data-dismiss":"modal"}," Close ",-1),Ve={type:"submit",class:"btn btn-primary"},Me={name:"LoanTypeForm",props:{form:Object,action:String,item:Number},setup(t){const d=t,p=u().props.value.paymentFrequencies,_=u().props.value.penaltyFrequencies,h=u().props.value.interestTypes,g=u().props.value.penaltyTypes;function b(){d.action=="Edit"?d.form.put(route("loanTypes.update",d.item),{onSuccess:()=>{d.form.reset(),document.getElementById("closeModal").click()}}):d.form.post(route("loanTypes.store"),{onSuccess:()=>{d.form.reset(),document.getElementById("closeModal").click()}})}return(Fe,r)=>(s(),n("div",x,[e("div",k,[e("div",T,[e("div",V,[e("h5",F,l(t.action)+" Loan Type.",1),S]),e("form",{onSubmit:r[11]||(r[11]=q(o=>b(),["prevent"]))},[e("div",M,[e("div",U,[e("div",P,[e("div",I,[L,a(e("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":r[0]||(r[0]=o=>t.form.name=o),id:"name",placeholder:"Loan Type"},null,512),[[m,t.form.name]]),t.form.errors.name?(s(),n("div",w,[e("small",null,l(t.form.errors.name),1)])):i("",!0)]),e("div",B,[C,a(e("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":r[1]||(r[1]=o=>t.form.interest_rate=o),id:"interest_rate",placeholder:"Interest Rate"},null,512),[[m,t.form.interest_rate]]),t.form.errors.interest_rate?(s(),n("div",D,[e("small",null,l(t.form.errors.interest_rate),1)])):i("",!0)]),e("div",E,[R,a(e("select",{required:"","onUpdate:modelValue":r[2]||(r[2]=o=>t.form.interest_duration=o),class:"form-control",id:"interest_duration"},O,512),[[c,t.form.interest_duration]]),t.form.errors.interest_duration?(s(),n("div",$,[e("small",null,l(t.form.errors.interest_duration),1)])):i("",!0)]),e("div",z,[A,a(e("select",{required:"","onUpdate:modelValue":r[3]||(r[3]=o=>t.form.interest_type=o),class:"form-control",id:"interest_type"},[G,(s(!0),n(f,null,y(v(h),o=>(s(),n("option",{key:o.id,value:o.id},l(o.display_name),9,H))),128))],512),[[c,t.form.interest_type]]),t.form.errors.interest_type?(s(),n("div",J,[e("small",null,l(t.form.errors.interest_type),1)])):i("",!0)]),e("div",K,[Q,a(e("select",{required:"","onUpdate:modelValue":r[4]||(r[4]=o=>t.form.payment_frequency=o),class:"form-control",id:"payment_frequency"},[W,(s(!0),n(f,null,y(v(p),o=>(s(),n("option",{key:o.id,value:o.id},l(o.display_name),9,X))),128))],512),[[c,t.form.payment_frequency]]),t.form.errors.payment_frequency?(s(),n("div",Z,[e("small",null,l(t.form.errors.payment_frequency),1)])):i("",!0)]),e("div",ee,[te,a(e("select",{required:"","onUpdate:modelValue":r[5]||(r[5]=o=>t.form.penalty_type=o),class:"form-control",id:"penalty_type"},[oe,(s(!0),n(f,null,y(v(g),o=>(s(),n("option",{key:o.id,value:o.id},l(o.display_name),9,re))),128))],512),[[c,t.form.penalty_type]]),t.form.errors.penalty_type?(s(),n("div",se,[e("small",null,l(t.form.errors.penalty_type),1)])):i("",!0)]),e("div",ne,[le,a(e("select",{required:"","onUpdate:modelValue":r[6]||(r[6]=o=>t.form.penalty_frequency=o),class:"form-control",id:"penalty_frequency"},[ae,(s(!0),n(f,null,y(v(_),o=>(s(),n("option",{key:o.id,value:o.id},l(o.display_name),9,ie))),128))],512),[[c,t.form.penalty_frequency]]),t.form.errors.penalty_frequency?(s(),n("div",de,[e("small",null,l(t.form.errors.penalty_frequency),1)])):i("",!0)]),e("div",me,[ce,a(e("input",{type:"number",class:"form-control",id:"penalty_value","onUpdate:modelValue":r[7]||(r[7]=o=>t.form.penalty_value=o),placeholder:"Penalty Value"},null,512),[[m,t.form.penalty_value]]),t.form.errors.penalty_value?(s(),n("div",ue,[e("small",null,l(t.form.errors.penalty_value),1)])):i("",!0)]),e("div",fe,[ye,a(e("input",{type:"text",class:"form-control",id:"service_fee","onUpdate:modelValue":r[8]||(r[8]=o=>t.form.service_fee=o),placeholder:"Serveice Fee"},null,512),[[m,t.form.service_fee]]),t.form.errors.service_fee?(s(),n("div",ve,[e("small",null,l(t.form.errors.service_fee),1)])):i("",!0)]),e("div",pe,[_e,a(e("input",{type:"number",class:"form-control",id:"repayment_period","onUpdate:modelValue":r[9]||(r[9]=o=>t.form.repayment_period=o),placeholder:"Repayment Period (Months)"},null,512),[[m,t.form.repayment_period]]),t.form.errors.repayment_period?(s(),n("div",he,[e("small",null,l(t.form.errors.repayment_period),1)])):i("",!0)]),e("div",ge,[e("div",be,[qe,a(e("textarea",{class:"form-control","onUpdate:modelValue":r[10]||(r[10]=o=>t.form.description=o),placeholder:"Short description",id:"exampleFormControlTextarea1",rows:"4"},null,512),[[m,t.form.description]]),t.form.errors.description?(s(),n("div",xe,[e("small",null,l(t.form.errors.description),1)])):i("",!0)])])])])]),e("div",ke,[Te,e("button",Ve,l(t.action)+" Loan Type ",1)])],32)])])]))}};export{Me as default};

import{j as h,u as A,o as a,c as b,w as v,b as e,f as d,v as p,e as t,l,t as r,p as _,g as m,m as g,F as x,d as k}from"./app.7d06a11a.js";import q from"./EditApplication.6d252d5c.js";const V={class:"row mt-3"},U={class:"form-group col-md-4"},N=e("label",{for:"witness_first_name"},"First Name:",-1),C={key:0,class:"text-danger"},S={class:"form-group col-md-4"},F=e("label",{for:"witness_last_name"},"Last Name:",-1),j={key:0,class:"text-danger"},T={class:"form-group col-md-4"},P=e("label",{for:"witness_type"},"Witness Type:",-1),B=e("option",{value:"",selected:""},"Select Witness Type",-1),L=["value"],M={key:0,class:"text-danger"},D={class:"form-group col-md-4"},E=e("label",{for:"witness_email"},"Email:",-1),W={key:0,class:"text-danger"},I={class:"form-group col-md-4"},R=e("label",{for:"witness_phone"},"Phone Number:",-1),$={key:0,class:"text-danger"},z={class:"form-group col-md-4"},K=e("label",{for:"witness_national_id"},"National Id:",-1),O={key:0,class:"text-danger"},G=e("div",{class:"col-12 mt-3 text-primary"},[e("h6",null,"Adress Details"),e("hr")],-1),H={class:"form-group col-sm-4"},J=e("label",null,"Country:",-1),Q=e("option",{value:""},"Select Country",-1),X=e("option",null,"Kenya",-1),Y=e("option",null,"Uganda",-1),Z=e("option",null,"Tanzania",-1),ee=e("option",null,"South Africa",-1),se=[Q,X,Y,Z,ee],te={key:0,class:"text-danger"},ne={class:"form-group col-md-4"},oe=e("label",{for:"witness_city"},"City:",-1),ie={key:0,class:"text-danger"},ae={class:"form-group col-md-4"},le=e("label",{for:"witness_postal_address"},"Postal Address:",-1),re={key:0,class:"text-danger"},de={class:"form-group col-md-4"},_e=e("label",{for:"witness_residential_address"},"Residential Address:",-1),pe={key:0,class:"text-danger"},ce={class:"modal-footer mt-3"},me={key:0,type:"submit",class:"btn btn-primary"},ue={key:1,type:"button",class:"btn btn-danger"},fe={name:"WitnessForm",props:{loanApplication:Object},setup(c){const n=c,u=h().props.value.witnessTypes;let s=A({id:n.loanApplication.id,member:n.loanApplication.member_id,guarantors:n.loanApplication.guarantors,member_id:n.loanApplication.member_id,loan_officer:n.loanApplication.loan_officer_id,loan_type:n.loanApplication.loan_type_id,reduce_principal_early:n.loanApplication.reduce_principal_early,amount_applied:n.loanApplication.amount_applied,interest_rate:n.loanApplication.interest_rate,periodic_payment_amount:n.loanApplication.periodic_payment_amount,application_date:n.loanApplication.application_date,disburse_method:n.loanApplication.disburse_method_id,disburse_note:n.loanApplication.disburse_note,mpesa_number:n.loanApplication.mpesa_number,mpesa_first_name:n.loanApplication.mpesa_first_name,mpesa_middle_name:n.loanApplication.mpesa_middle_name,mpesa_last_name:n.loanApplication.mpesa_last_name,cheque_number:n.loanApplication.cheque_number,bank_name:n.loanApplication.bank_name,bank_branch:n.loanApplication.bank_branch,cheque_date:n.loanApplication.cheque_date,witness_type:n.loanApplication.witness_type_id,witness_first_name:n.loanApplication.witness_first_name,witness_last_name:n.loanApplication.witness_last_name,witness_country:n.loanApplication.witness_country,witness_county:n.loanApplication.witness_county,witness_city:n.loanApplication.witness_city,witness_national_id:n.loanApplication.witness_national_id,witness_phone:n.loanApplication.witness_phone,witness_email:n.loanApplication.witness_email,witness_postal_address:n.loanApplication.witness_postal_address,witness_residential_address:n.loanApplication.witness_residential_address,witnessed_by:n.loanApplication.witnessed_by_user_id,reviewed_by:n.loanApplication.reviewed_by_user_id,reviewed_on:n.loanApplication.reviewed_on,approved_on:n.loanApplication.approved_on,rejected_on:n.loanApplication.rejected_on,rejection_notes:n.loanApplication.rejection_notes});function w(){s.put(route("loanApplications.witness.update",n.loanApplication.id),{onSuccess:()=>{}})}return(y,i)=>(a(),b(q,{loanApplication:c.loanApplication,active:"witness"},{default:v(()=>[e("form",{onSubmit:i[11]||(i[11]=k(o=>w(),["prevent"]))},[e("div",V,[e("div",U,[N,d(e("input",{type:"text","onUpdate:modelValue":i[0]||(i[0]=o=>t(s).witness_first_name=o),class:"form-control",required:"",id:"witness_first_name",placeholder:"First Name"},null,512),[[p,t(s).witness_first_name]]),t(s).errors.witness_first_name?(a(),l("div",C,[e("small",null,r(t(s).errors.witness_first_name),1)])):_("",!0)]),e("div",S,[F,d(e("input",{type:"text","onUpdate:modelValue":i[1]||(i[1]=o=>t(s).witness_last_name=o),class:"form-control",required:"",id:"witness_last_name",placeholder:"Last Name"},null,512),[[p,t(s).witness_last_name]]),t(s).errors.witness_last_name?(a(),l("div",j,[e("small",null,r(t(s).errors.witness_last_name),1)])):_("",!0)]),e("div",T,[P,d(e("select",{required:"",onChange:i[2]||(i[2]=o=>y.selectMember(o)),"onUpdate:modelValue":i[3]||(i[3]=o=>t(s).witness_type=o),class:"form-control",id:"witness_type"},[B,(a(!0),l(x,null,g(t(u),(o,f)=>(a(),l("option",{value:o.id,key:f},r(o.name),9,L))),128))],544),[[m,t(s).witness_type]]),t(s).errors.witness_type?(a(),l("div",M,[e("small",null,r(t(s).errors.witness_type),1)])):_("",!0)]),e("div",D,[E,d(e("input",{type:"email","onUpdate:modelValue":i[4]||(i[4]=o=>t(s).witness_email=o),class:"form-control",required:"",id:"witness_email",placeholder:"Email"},null,512),[[p,t(s).witness_email]]),t(s).errors.witness_email?(a(),l("div",W,[e("small",null,r(t(s).errors.witness_email),1)])):_("",!0)]),e("div",I,[R,d(e("input",{type:"text","onUpdate:modelValue":i[5]||(i[5]=o=>t(s).witness_phone=o),class:"form-control",required:"",id:"witness_phone",placeholder:"Phone Number"},null,512),[[p,t(s).witness_phone]]),t(s).errors.witness_phone?(a(),l("div",$,[e("small",null,r(t(s).errors.witness_phone),1)])):_("",!0)]),e("div",z,[K,d(e("input",{type:"text","onUpdate:modelValue":i[6]||(i[6]=o=>t(s).witness_national_id=o),class:"form-control",required:"",id:"witness_national_id",placeholder:"National Id"},null,512),[[p,t(s).witness_national_id]]),t(s).errors.witness_national_id?(a(),l("div",O,[e("small",null,r(t(s).errors.witness_national_id),1)])):_("",!0)]),G,e("div",H,[J,d(e("select",{required:"","onUpdate:modelValue":i[7]||(i[7]=o=>t(s).witness_country=o),class:"form-control",id:"selectcountry"},se,512),[[m,t(s).witness_country]]),t(s).errors.witness_country?(a(),l("div",te,[e("small",null,r(t(s).errors.witness_country),1)])):_("",!0)]),e("div",ne,[oe,d(e("input",{type:"text","onUpdate:modelValue":i[8]||(i[8]=o=>t(s).witness_city=o),class:"form-control",required:"",id:"witness_city",placeholder:"City"},null,512),[[p,t(s).witness_city]]),t(s).errors.witness_city?(a(),l("div",ie,[e("small",null,r(t(s).errors.witness_city),1)])):_("",!0)]),e("div",ae,[le,d(e("input",{type:"text","onUpdate:modelValue":i[9]||(i[9]=o=>t(s).witness_postal_address=o),class:"form-control",required:"",id:"witness_postal_address",placeholder:"Postal Address"},null,512),[[p,t(s).witness_postal_address]]),t(s).errors.witness_postal_address?(a(),l("div",re,[e("small",null,r(t(s).errors.witness_postal_address),1)])):_("",!0)]),e("div",de,[_e,d(e("input",{type:"text","onUpdate:modelValue":i[10]||(i[10]=o=>t(s).witness_residential_address=o),class:"form-control",required:"",id:"witness_residential_address",placeholder:"Residential Address"},null,512),[[p,t(s).witness_residential_address]]),t(s).errors.witness_residential_address?(a(),l("div",pe,[e("small",null,r(t(s).errors.witness_residential_address),1)])):_("",!0)])]),e("div",ce,[c.loanApplication.approved_on==null?(a(),l("button",me," Save Changes ")):(a(),l("button",ue,"Active Loan"))])],32)]),_:1},8,["loanApplication"]))}};export{fe as default};

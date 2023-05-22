import{u as k,j as g,r as w,o as _,c as P,w as F,b as e,f as l,g as q,e as n,l as p,m as x,t as u,F as V,p as c,v as i,d as A}from"./app.234aa32e.js";import T from"./EditApplication.33517a13.js";const S={class:"row mt-3"},I=e("div",{class:"col-12 mt-3 text-primary"},[e("h6",null,"Personal Information"),e("hr")],-1),M={class:"form-group col-md-4"},N=e("label",{for:"member"},"Member:",-1),j=e("option",{value:"",selected:""},"Select Member",-1),E=["value"],D={key:0,class:"text-danger"},B={class:"form-group col-md-4"},C=e("label",{for:"account_number"},"Account No:",-1),R={class:"form-group col-md-4"},$=e("label",{for:"id_number"},"National Id:",-1),J={class:"form-group col-md-4"},O=e("label",{for:"account_number"},"Address:",-1),z={class:"form-group col-md-4"},G=e("label",{for:"email"},"Email:",-1),H={class:"form-group col-md-4"},K=e("label",{for:"email"},"Phone:",-1),Q={class:"form-group col-md-4"},W=e("label",{for:"date_became_member"}," Date of Joining:",-1),X=e("div",{class:"col-12 mt-3 text-primary"},[e("h6",null,"Loan Details"),e("hr")],-1),Y={class:"form-group col-md-4"},Z=e("label",{for:"loan"},"Loan:",-1),ee=e("option",{value:"",selected:""},"Select Loan",-1),te=["value"],ae={key:0,class:"text-danger"},oe={class:"form-group col-md-4"},ne=e("label",{for:"interest_type"},"Interest Type:",-1),se={key:0,class:"text-danger"},le={class:"form-group col-md-4"},re=e("label",{for:"interest"},"Interest:",-1),ie={key:0,class:"text-danger"},de={class:"form-group col-md-4"},_e=e("label",{for:"service_fee"},"Service Fee:",-1),pe={class:"form-group col-md-4"},ue=e("label",{for:"amount_applied"},"Amount Applied:",-1),ce={key:0,class:"text-danger"},me={class:"form-group col-md-4"},ve=e("label",{for:"application_date"},"Application Date:",-1),ye={key:0,class:"text-danger"},fe=e("div",{class:"col-12 mt-3 text-primary"},[e("h6",null,"Repayment & Penalty"),e("hr")],-1),be={class:"form-group col-md-4"},he=e("label",{for:"rpay"},"Repayment Period (Months):",-1),Le={class:"form-group col-md-4"},ge=e("label",{for:"payment_frequency"},"Payment Frequency:",-1),we={class:"form-group col-md-4"},qe=e("label",{for:"penalty"}," Penalty Type:",-1),xe={class:"form-group col-md-4"},Ve=e("label",{for:"pfre"},"Penalty Frequency:",-1),Ue={class:"form-group col-md-4"},ke=e("label",{for:"p_value"}," Penalty Amount:",-1),Ae={name:"EditForm",props:{activeLoan:Object},setup(y){const o=y;let s=k({id:o.activeLoan.id,member:o.activeLoan.member_id,guarantors:o.activeLoan.guarantors,member_id:o.activeLoan.member_id,loan_officer:o.activeLoan.loan_officer_id,loan_type:o.activeLoan.loan_type_id,reduce_principal_early:o.activeLoan.reduce_principal_early,amount_applied:o.activeLoan.amount_applied,interest_rate:o.activeLoan.interest_rate,periodic_payment_amount:o.activeLoan.periodic_payment_amount,application_date:o.activeLoan.application_date,disburse_method:o.activeLoan.disburse_method_id,disburse_note:o.activeLoan.disburse_note,mpesa_number:o.activeLoan.mpesa_number,mpesa_first_name:o.activeLoan.mpesa_first_name,mpesa_middle_name:o.activeLoan.mpesa_middle_name,mpesa_last_name:o.activeLoan.mpesa_last_name,cheque_number:o.activeLoan.cheque_number,bank_name:o.activeLoan.bank_name,bank_branch:o.activeLoan.bank_branch,cheque_date:o.activeLoan.cheque_date,witness_type:o.activeLoan.witness_type_id,witness_first_name:o.activeLoan.witness_first_name,witness_last_name:o.activeLoan.witness_last_name,witness_country:o.activeLoan.witness_country,witness_county:o.activeLoan.witness_county,witness_city:o.activeLoan.witness_city,witness_national_id:o.activeLoan.witness_national_id,witness_phone:o.activeLoan.witness_phone,witness_email:o.activeLoan.witness_email,witness_postal_address:o.activeLoan.witness_postal_address,witness_residential_address:o.activeLoan.witness_residential_address,witnessed_by:o.activeLoan.witnessed_by_user_id,reviewed_by:o.activeLoan.reviewed_by_user_id,reviewed_on:o.activeLoan.reviewed_on,approved_on:o.activeLoan.approved_on,rejected_on:o.activeLoan.rejected_on,rejection_notes:o.activeLoan.rejection_notes,repayment_period:o.activeLoan.repayment_period});const f=g().props.value.members,d=w({account:"",id_number:"",residential_address:"",email:"",phone:"",date_became_member:""}),b=g().props.value.loanTypes,r=w({interest:"",penalty:"",p_value:"",service_fee:"",repayment_period:"",payment_frequency:"",penalty_frequency:"",interest_type:""}),h=m=>{f.forEach(t=>{t.id==m.target.value&&(d.value={account:t.account.account_number,id_number:t.id_number,residential_address:t.residential_address,email:t.email,phone:t.phone,date_became_member:t.date_became_member})})},L=m=>{b.forEach(t=>{t.id==m.target.value&&(r.value={interest:t.interest_rate,penalty:t.penaltyType.display_name,p_value:t.penalty_value,service_fee:t.service_fee,repayment_period:t.repayment_period,penalty_frequency:t.penaltyFrequency.display_name,payment_frequency:t.paymentFrequency.display_name,interest_type:t.interestType.display_name})})};h({target:{value:o.activeLoan.member_id}}),L({target:{value:o.activeLoan.loan_type_id}});function U(){s.put(route("activeLoans.update",o.activeLoan.id),{onSuccess:()=>{}})}return(m,t)=>(_(),P(T,{id:y.activeLoan.id,active:"details"},{default:F(()=>[e("form",{onSubmit:t[20]||(t[20]=A(a=>U(),["prevent"]))},[e("div",S,[I,e("div",M,[N,l(e("select",{required:"",onChange:t[0]||(t[0]=a=>h(a)),"onUpdate:modelValue":t[1]||(t[1]=a=>n(s).member=a),class:"form-control",id:"member"},[j,(_(!0),p(V,null,x(n(f),(a,v)=>(_(),p("option",{value:a.id,key:v},u(a.first_name)+" "+u(a.last_name),9,E))),128))],544),[[q,n(s).member]]),n(s).errors.member?(_(),p("div",D,[e("small",null,u(n(s).errors.member),1)])):c("",!0)]),e("div",B,[C,l(e("input",{type:"text","onUpdate:modelValue":t[2]||(t[2]=a=>d.value.account=a),class:"form-control",required:"",id:"account_number",placeholder:"Account Number"},null,512),[[i,d.value.account]])]),e("div",R,[$,l(e("input",{type:"text","onUpdate:modelValue":t[3]||(t[3]=a=>d.value.id_number=a),class:"form-control",required:"",id:"id_number",placeholder:"National Id"},null,512),[[i,d.value.id_number]])]),e("div",J,[O,l(e("input",{type:"text","onUpdate:modelValue":t[4]||(t[4]=a=>d.value.residential_address=a),class:"form-control",required:"",id:"account_number",placeholder:"Residential Address"},null,512),[[i,d.value.residential_address]])]),e("div",z,[G,l(e("input",{type:"text","onUpdate:modelValue":t[5]||(t[5]=a=>d.value.email=a),class:"form-control",required:"",id:"email",placeholder:"Email"},null,512),[[i,d.value.email]])]),e("div",H,[K,l(e("input",{type:"text","onUpdate:modelValue":t[6]||(t[6]=a=>d.value.phone=a),class:"form-control",required:"",id:"email",placeholder:"Phone Number"},null,512),[[i,d.value.phone]])]),e("div",Q,[W,l(e("input",{type:"date",class:"form-control",id:"date_became_member","onUpdate:modelValue":t[7]||(t[7]=a=>d.value.date_became_member=a)},null,512),[[i,d.value.date_became_member]])]),X,e("div",Y,[Z,l(e("select",{onChange:t[8]||(t[8]=a=>L(a)),required:"","onUpdate:modelValue":t[9]||(t[9]=a=>n(s).loan_type=a),class:"form-control",id:"loan"},[ee,(_(!0),p(V,null,x(n(b),(a,v)=>(_(),p("option",{value:a.id,key:v},u(a.name),9,te))),128))],544),[[q,n(s).loan_type]]),n(s).errors.loan?(_(),p("div",ae,[e("small",null,u(n(s).errors.loan),1)])):c("",!0)]),e("div",oe,[ne,l(e("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":t[10]||(t[10]=a=>r.value.interest_type=a),id:"interest_type",placeholder:"Interest Type"},null,512),[[i,r.value.interest_type]]),n(s).errors.interest_type?(_(),p("div",se,[e("small",null,u(n(s).errors.interest_type),1)])):c("",!0)]),e("div",le,[re,l(e("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":t[11]||(t[11]=a=>r.value.interest=a),id:"interest",placeholder:"interest"},null,512),[[i,r.value.interest]]),n(s).errors.interest?(_(),p("div",ie,[e("small",null,u(n(s).errors.Interest),1)])):c("",!0)]),e("div",de,[_e,l(e("input",{type:"text",class:"form-control",id:"service_fee","onUpdate:modelValue":t[12]||(t[12]=a=>r.value.service_fee=a),placeholder:"Service Fee"},null,512),[[i,r.value.service_fee]])]),e("div",pe,[ue,l(e("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":t[13]||(t[13]=a=>n(s).amount_applied=a),id:"amount_applied",placeholder:"Amount Applied"},null,512),[[i,n(s).amount_applied]]),n(s).errors.amount_applied?(_(),p("div",ce,[e("small",null,u(n(s).errors.amount_applied),1)])):c("",!0)]),e("div",me,[ve,l(e("input",{type:"date",class:"form-control",required:"","onUpdate:modelValue":t[14]||(t[14]=a=>n(s).application_date=a),id:"application_date",placeholder:"application_date"},null,512),[[i,n(s).application_date]]),n(s).errors.application_date?(_(),p("div",ye,[e("small",null,u(n(s).errors.application_date),1)])):c("",!0)]),fe,e("div",be,[he,l(e("input",{type:"text",class:"form-control",id:"rpay","onUpdate:modelValue":t[15]||(t[15]=a=>r.value.repayment_period=a),placeholder:"Repayment Period"},null,512),[[i,r.value.repayment_period]])]),e("div",Le,[ge,l(e("input",{type:"text",class:"form-control",id:"payment_frequency","onUpdate:modelValue":t[16]||(t[16]=a=>r.value.payment_frequency=a),placeholder:"Payment Frequency"},null,512),[[i,r.value.payment_frequency]])]),e("div",we,[qe,l(e("input",{type:"text",class:"form-control",id:"penalty","onUpdate:modelValue":t[17]||(t[17]=a=>r.value.penalty=a),placeholder:" Penalty Type"},null,512),[[i,r.value.penalty]])]),e("div",xe,[Ve,l(e("input",{type:"text",class:"form-control",id:"pfre","onUpdate:modelValue":t[18]||(t[18]=a=>r.value.penalty_frequency=a),placeholder:"Penalty Frequency"},null,512),[[i,r.value.penalty_frequency]])]),e("div",Ue,[ke,l(e("input",{type:"text",class:"form-control",id:"p_value","onUpdate:modelValue":t[19]||(t[19]=a=>r.value.p_value=a),placeholder:"Penalty Amount"},null,512),[[i,r.value.p_value]])])])],32)]),_:1},8,["id"]))}};export{Ae as default};

import{r as F,o as _,c as D,w as S,b as t,s as L,e as u,l as y,t as c,n as g,F as x,m as k}from"./app.24fde918.js";import N from"./EditApplication.71ccdbe5.js";const w={class:"mt-5"},P=t("h6",{class:"text-white"},"Principle",-1),U=[P],A={key:0,class:"table-responsive"},C={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid"},I=t("thead",null,[t("tr",null,[t("th",null,"Loan No."),t("th",null,"Current Principle"),t("th",null,"Amount Paid"),t("th",null,"Total Interests"),t("th",null,"Total Penalties"),t("th",null,"Status"),t("th",null,"Due Date")])],-1),B={key:0},$=t("td",null,[t("span",{class:"active"},"Active")],-1),q=t("td",null,"2024-03-01",-1),O={class:"mt-5"},R=t("h6",{class:"text-white"},"Interest",-1),T=[R],V={key:0,class:"table-responsive"},j={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid"},E=t("thead",null,[t("tr",null,[t("th",null,"Inst. No"),t("th",null,"Principle"),t("th",null,"Interest"),t("th",null,"Installments"),t("th",null,"Outstanding")])],-1),M={class:"mt-5"},W=t("h6",{class:"text-white"},"Penalties",-1),z=[W],G={key:0,class:"table-responsive"},H=t("table",{id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid"},[t("thead",null,[t("tr",null,[t("th",null,"Loan No."),t("th",null,"Principle"),t("th",null,"Amount"),t("th",null,"Status"),t("th",null,"Action")])]),t("tbody")],-1),J=[H],Y={name:"Accrue",props:{activeLoan:Object,id:Number,payments_sum:Number,months:Number},setup(b){const o=b;let l=F(),s=F("principle");return(()=>{let r=0,n=o.payments_sum,e=0,d=0;const v=o.activeLoan.repayment_period/12,h=o.activeLoan.payment_frequency.display_name;if(h=="Annually"?r=1:h=="semi_annualy"?r=2:h=="quaterly"?r=4:h=="Monthly"?r=12:h=="Weekly"?r=52.1786:h=="daily"&&(r=365),l.value={principle:e,amount_applied:o.activeLoan.amount_approved,periods:r,payments:[]},e=o.activeLoan.amount_approved,o.activeLoan.interest_type.display_name=="Fixed Rate"){let a=e*(o.activeLoan.interest_rate/100)*v,i=Number(e)+Number(a),p=i/(r*v),m=a/(r*v);for(let f=1;f<=o.months;f++)l.value.payments.push({period:f,principle:i,payment_per_month:p,payment_amount:p,payments:n+p,interest:d+m,interest_amount:m}),e=i-p,i=e,n=n+p,d=d+m}else{let a=e/(r*v),i=e*(1+o.activeLoan.interest_rate/100/12);for(let p=1;p<=o.months;p++){e<a&&l.value.payments.push({period:p,principle:i,payment_per_month:a,payment_amount:a+i-e,payments:n+a+i-e,interest:d+i-e,interest_amount:i-e});let m=i-e;l.value.payments.push({period:p,principle:i,payment_per_month:a,payment_amount:a+m,payments:n+a+m,interest:d+m,interest_amount:m}),e=i-(a+m),i=e*(1+o.activeLoan.interest_rate/100/12),n=n+a+m,d=d+m}}console.log(l.value)})(),(r,n)=>(_(),D(N,{id:b.id,active:"accrue"},{default:S(()=>[t("div",w,[t("div",{class:"card-header bg-primary py-2",onClick:n[0]||(n[0]=e=>L(s)?s.value="principle":s="principle")},U),u(s)=="principle"?(_(),y("div",A,[t("table",C,[I,t("tbody",null,[u(l).payments.length>0?(_(),y("tr",B,[t("td",null,c(u(l).payments[u(l).payments.length-1].period),1),t("td",null,c(u(l).payments[u(l).payments.length-1].principle.toLocaleString("en-US",{minimumFractionDigits:1,maximumFractionDigits:1})+"0"),1),t("td",null,c(b.payments_sum.toLocaleString("en-US",{minimumFractionDigits:1,maximumFractionDigits:1})+"0"),1),t("td",null,c(u(l).payments[u(l).payments.length-1].payment_amount.toLocaleString("en-US",{minimumFractionDigits:1,maximumFractionDigits:1})+"0"),1),t("td",null,c("00.0"),1),$,q])):g("",!0)])])])):g("",!0)]),t("div",O,[t("div",{class:"card-header bg-primary py-2",onClick:n[1]||(n[1]=e=>L(s)?s.value="interest":s="interest")},T),u(s)=="interest"?(_(),y("div",V,[t("table",j,[E,t("tbody",null,[(_(!0),y(x,null,k(u(l).payments,(e,d)=>(_(),y("tr",{key:d},[t("td",null,c(e.period),1),t("td",null,c(e.principle.toLocaleString("en-US",{minimumFractionDigits:1,maximumFractionDigits:1})+"0"),1),t("td",null,c(e.interest_amount.toLocaleString("en-US",{minimumFractionDigits:1,maximumFractionDigits:1})+"0"),1),t("td",null,c(e.payment_amount.toLocaleString("en-US",{minimumFractionDigits:1,maximumFractionDigits:1})+"0"),1),t("td",null,c((e.principle-e.payment_amount).toLocaleString("en-US",{minimumFractionDigits:1,maximumFractionDigits:1})+"0"),1)]))),128))])])])):g("",!0)]),t("div",M,[t("div",{class:"card-header bg-primary py-2",onClick:n[2]||(n[2]=e=>L(s)?s.value="penalties":s="penalties")},z),u(s)=="penalties"?(_(),y("div",G,J)):g("",!0)])]),_:1},8,["id"]))}};export{Y as default};

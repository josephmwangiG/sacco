import{j as v,r as y,E as M,a as S,o as f,l as g,e as a,k as p,n as k,b as x}from"./app.24fde918.js";const L={class:"row"},E={key:0,class:"col-md-4 mt-3"},A={class:"col-md-4 mt-3"},B={class:"col-md-4 mt-3"},K={name:"Statistics",setup(T){const n=v().props.value;let i=y(null);console.log(n.loans);let h=y(null),_={title:{text:"Monthly Transactions",position:"center"},labels:["Deposits","Loans"],legend:{position:"top"}},b=[n.deposits_total,n.loans_total],w={chart:{stacked:!0,type:"bar"},title:{text:"Arrears"}},D=[{name:"Paid",data:[{x:"Loans",y:10},{x:"Deposits",y:18},{x:"Disbursments",y:5}]},{name:"Due Payments",data:[{x:"Loans",y:5},{x:"Deposits",y:6},{x:"Disbursments",y:13}]}];return M(()=>{const l=[],s=new Date;for(let t=0;t<12;t++){const e=new Date(s);e.setMonth(s.getMonth()-t);const u=e.toLocaleString("default",{month:"short"});l.unshift(u)}console.log(l);const o={},m=new Date(s);m.setMonth(s.getMonth()-12),n.loans.forEach(t=>{const e=new Date(t.start_date);if(e>=m&&e<=s){const r=(e.getMonth()+1).toString();o[r]||(o[r]={loans:[],total:0}),o[r].loans.push(t),o[r].total+=parseFloat(t.amount_approved)}});const d=[],c=[];for(let t=12;t>0;t--){const e=(s.getMonth()-t+2).toString();d.push({month:e,loans:o[e]?o[e].loans:[],total:o[e]?o[e].total:0}),c.push(o[e]?o[e].total:0)}console.log(d),console.log(c),i.value={chart:{height:350,type:"bar"},toolbar:{show:!1},stroke:{show:!0,width:2,colors:["transparent"]},xaxis:{categories:l,position:"bottom",axisTicks:{show:!1},crosshairs:{fill:{type:"gradient",gradient:{colorFrom:"#D8E3F0",colorTo:"#BED1E6",stops:[0,100],opacityFrom:.4,opacityTo:.5}}},tooltip:{enabled:!0}},plotOptions:{bar:{dataLabels:{position:"top"}}},dataLabels:{enabled:!0,formatter:function(t){return t.toLocaleString("en-US")},offsetY:-20,style:{fontSize:"12px",colors:["#304758"]}},yaxis:{axisBorder:{show:!1},axisTicks:{show:!1},labels:{show:!1,formatter:function(t){return t+"%"}}},title:{text:"Active Loans",style:{color:"#444"}}},h.value=[{name:"Amount (KES)",data:c}]}),(l,s)=>{const o=S("apexchart");return f(),g("div",L,[a(i)!=null?(f(),g("div",E,[p(o,{width:"100%",type:"bar",height:"380",options:a(i),series:a(h)},null,8,["options","series"])])):k("",!0),x("div",A,[p(o,{width:"100%",height:"380",type:"bar",options:a(w),series:a(D)},null,8,["options","series"])]),x("div",B,[p(o,{width:"100%",class:"",height:"380",type:"donut",options:a(_),series:a(b)},null,8,["options","series"])])])}}};export{K as default};
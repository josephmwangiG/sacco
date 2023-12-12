import{o as d,l as r,b as e,t as l,d as f,f as a,v as i,n,g as u}from"./app.a9a0490e.js";const h={class:"modal fade",id:"formModal",tabindex:"-1",role:"dialog","aria-labelledby":"formModal","aria-hidden":"true"},y={class:"modal-dialog modal-xl",role:"document"},b={class:"modal-content"},v={class:"modal-header"},_={class:"modal-title",id:"formModal"},g=e("button",{type:"button",class:"close","data-dismiss":"modal","aria-label":"Close"},[e("span",{"aria-hidden":"true"},"\xD7")],-1),x={class:"modal-body modal-div"},k={class:"new-user-info"},V={class:"row"},U={class:"form-group col-md-4"},N=e("label",{for:"first_name"},"First Name:",-1),M={key:0,class:"text-danger"},S={class:"form-group col-md-4"},A=e("label",{for:"last_name"},"Last Name:",-1),C={key:0,class:"text-danger"},P={class:"form-group col-md-4"},B=e("label",{for:"email"},"Email:",-1),E={key:0,class:"text-danger"},L={class:"form-group col-md-4"},q=e("label",{for:"email"},"Phone:",-1),D={key:0,class:"text-danger"},w={class:"form-group col-md-4"},F=e("label",{for:"address"},"Physical Address:",-1),I={key:0,class:"text-danger"},R=e("div",{class:"col-12 mt-3 text-primary"},[e("h6",null,"Location & Address"),e("hr")],-1),T={class:"form-group col-md-4"},j=e("label",{for:"nationality"},"Nationality:",-1),z=e("option",{value:""},"Select Country",-1),K=e("option",null,"Kenya",-1),O=e("option",null,"Uganda",-1),$=e("option",null,"Tanzania",-1),G=e("option",null,"South Africa",-1),H=[z,K,O,$,G],J={key:0,class:"text-danger"},Q={class:"form-group col-md-4"},W=e("label",{for:"pno"},"County/City:",-1),X={key:0,class:"text-danger"},Y={class:"form-group col-md-4"},Z=e("label",{for:"id_number"},"National ID / Passport:",-1),p={key:0,class:"text-danger"},ee={class:"form-group col-md-4"},oe=e("label",{for:"residential_address"}," Residential Address:",-1),te={key:0,class:"text-danger"},se={class:"form-group col-md-4"},le=e("label",{for:"pno"},"Postal Address:",-1),de={key:0,class:"text-danger"},re={class:"form-group col-md-4"},ae=e("label",{for:"date_of_birth"}," Date of Birth:",-1),ne={key:0,class:"text-danger"},ie={class:"modal-footer"},me=e("button",{type:"button",id:"closeModal",class:"btn btn-secondary","data-dismiss":"modal"}," Close ",-1),ce={type:"submit",class:"btn btn-primary"},he={name:"LeadForm",props:{form:Object,action:String,item:Number},setup(o){const m=o;function c(){m.action=="Edit"?m.form.put(route("leads.update",m.item),{onSuccess:()=>{m.form.reset(),document.getElementById("closeModal").click()}}):m.form.post(route("leads.store"),{onSuccess:()=>{m.form.reset(),document.getElementById("closeModal").click()}})}return(fe,t)=>(d(),r("div",h,[e("div",y,[e("div",b,[e("div",v,[e("h5",_,l(o.action)+" Lead.",1),g]),e("form",{onSubmit:t[11]||(t[11]=f(s=>c(),["prevent"]))},[e("div",x,[e("div",k,[e("div",V,[e("div",U,[N,a(e("input",{type:"text","onUpdate:modelValue":t[0]||(t[0]=s=>o.form.first_name=s),class:"form-control",required:"",id:"first_name",placeholder:"First Name"},null,512),[[i,o.form.first_name]]),o.form.errors.first_name?(d(),r("div",M,[e("small",null,l(o.form.errors.first_name),1)])):n("",!0)]),e("div",S,[A,a(e("input",{type:"text","onUpdate:modelValue":t[1]||(t[1]=s=>o.form.last_name=s),class:"form-control",required:"",id:"last_name",placeholder:"Last Name"},null,512),[[i,o.form.last_name]]),o.form.errors.last_name?(d(),r("div",C,[e("small",null,l(o.form.errors.last_name),1)])):n("",!0)]),e("div",P,[B,a(e("input",{type:"email",class:"form-control",required:"","onUpdate:modelValue":t[2]||(t[2]=s=>o.form.email=s),id:"email",placeholder:"Email"},null,512),[[i,o.form.email]]),o.form.errors.email?(d(),r("div",E,[e("small",null,l(o.form.errors.email),1)])):n("",!0)]),e("div",L,[q,a(e("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":t[3]||(t[3]=s=>o.form.phone=s),id:"phone",placeholder:"Phone"},null,512),[[i,o.form.phone]]),o.form.errors.phone?(d(),r("div",D,[e("small",null,l(o.form.errors.phone),1)])):n("",!0)]),e("div",w,[F,a(e("input",{type:"text",class:"form-control",id:"address","onUpdate:modelValue":t[4]||(t[4]=s=>o.form.address=s),placeholder:"Address"},null,512),[[i,o.form.address]]),o.form.errors.address?(d(),r("div",I,[e("small",null,l(o.form.errors.address),1)])):n("",!0)]),R,e("div",T,[j,a(e("select",{required:"","onUpdate:modelValue":t[5]||(t[5]=s=>o.form.nationality=s),class:"form-control",id:"nationality"},H,512),[[u,o.form.nationality]]),o.form.errors.nationality?(d(),r("div",J,[e("small",null,l(o.form.errors.nationality),1)])):n("",!0)]),e("div",Q,[W,a(e("input",{type:"text",class:"form-control",id:"pno","onUpdate:modelValue":t[6]||(t[6]=s=>o.form.city=s),placeholder:"County/State"},null,512),[[i,o.form.city]]),o.form.errors.city?(d(),r("div",X,[e("small",null,l(o.form.errors.city),1)])):n("",!0)]),e("div",Y,[Z,a(e("input",{type:"text",class:"form-control",id:"id_number","onUpdate:modelValue":t[7]||(t[7]=s=>o.form.id_number=s),placeholder:"National ID / Passport"},null,512),[[i,o.form.id_number]]),o.form.errors.id_number?(d(),r("div",p,[e("small",null,l(o.form.errors.id_number),1)])):n("",!0)]),e("div",ee,[oe,a(e("input",{type:"text",class:"form-control",id:"residential_address","onUpdate:modelValue":t[8]||(t[8]=s=>o.form.residential_address=s),placeholder:" Residential Address"},null,512),[[i,o.form.residential_address]]),o.form.errors.residential_address?(d(),r("div",te,[e("small",null,l(o.form.errors.residential_address),1)])):n("",!0)]),e("div",se,[le,a(e("input",{type:"text",class:"form-control",id:"pno","onUpdate:modelValue":t[9]||(t[9]=s=>o.form.postal_address=s),placeholder:"Postal Address"},null,512),[[i,o.form.postal_address]]),o.form.errors.postal_address?(d(),r("div",de,[e("small",null,l(o.form.errors.postal_address),1)])):n("",!0)]),e("div",re,[ae,a(e("input",{type:"date",class:"form-control",id:"date_of_birth","onUpdate:modelValue":t[10]||(t[10]=s=>o.form.date_of_birth=s)},null,512),[[i,o.form.date_of_birth]]),o.form.errors.date_of_birth?(d(),r("div",ne,[e("small",null,l(o.form.errors.date_of_birth),1)])):n("",!0)])])])]),e("div",ie,[me,e("button",ce,l(o.action)+" Lead ",1)])],32)])])]))}};export{he as default};

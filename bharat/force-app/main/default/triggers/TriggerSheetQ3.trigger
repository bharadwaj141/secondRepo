trigger TriggerSheetQ3 on Product2 (After insert) {
   
        List<id> st= new List<id>();

    List<Pricebook2> stand= [select id from Pricebook2 where IsStandard=true ];
    for(Pricebook2 pb2: stand){
        
        st.add(pb2.id);
        
    }
    For(Product2 pd:trigger.new){
     PricebookEntry Apple= new PricebookEntry();
        
             Apple.product2id=pd.id;
             Apple.pricebook2id=st[0];
             Apple.UnitPrice=1;
             Apple.IsActive=true;
        insert Apple;
   
    }
}
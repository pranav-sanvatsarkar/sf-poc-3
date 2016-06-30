public class AccountManagerController 
{
    public List<String> LstFieldAPINames { get; set; }
    public static string StrFieldSetname { get; set; }
	public AccountManagerController( ApexPages.StandardController controller )
	{
        try
    	{
	        LstFieldAPINames = new List<String>();
			List<Schema.FieldSetMember> lstFldStMmbrs = new List<Schema.FieldSetMember>(); 
	        if( StrFieldSetname == null )
	        	lstFldStMmbrs = Schema.getGlobalDescribe().get('Account').getDescribe().FieldSets.getMap().get('prnv_light_1__PersonalAccountFieldSet').getFields();
        	else
        		lstFldStMmbrs = Schema.getGlobalDescribe().get('Account').getDescribe().FieldSets.getMap().get(StrFieldSetname).getFields();
	        for( Schema.FieldSetMember field : lstFldStMmbrs )
	        	LstFieldAPINames.add(field.getFieldPath());
    	}
    	catch( Exception ex )
    	{
    		system.debug( 'Exception: ' + ex );
    		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, 'Exception: ' + ex.getMessage() + '; at line number: ' + ex.getLineNumber()));
    	}
    }
}
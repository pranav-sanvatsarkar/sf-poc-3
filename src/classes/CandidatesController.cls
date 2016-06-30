public class CandidatesController 
{
    public prnv_light_1__Candidate__c Candidate { get; set; }
	public CandidatesController()
    {
        Candidate = new prnv_light_1__Candidate__c();
    }
}
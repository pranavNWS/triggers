trigger createOppOnAccAnnualRev on Account (after insert) 
{
    List<Opportunity> OL = New List<Opportunity>();
    for(Account EA : trigger.New)
    {
        if(EA.AnnualRevenue > 5000000 && EA.Industry == 'Energy')
        {
            System.debug('Creating Opportunity for Account: ' + EA.Name);
            Opportunity Opp = New Opportunity();
            Opp.AccountId = EA.Id;
            Opp.Name = 'Opportunity where account annual revenue is more than 50 Lacs '+EA.Name;
            Opp.CloseDate = Date.newInstance(2024, 5, 15);
            Opp.StageName = '	Perception Analysis';
            OL.add(Opp);
        }
    }
    INSERT OL;
}
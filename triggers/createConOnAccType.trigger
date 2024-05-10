trigger createConOnAccType on Account (after insert) 
{
    List<Contact> CL = New List<Contact>();
    for(Account EA : Trigger.New)
    {
        if(EA.Type == 'prospect')
        {
            Contact con = New Contact();
            con.AccountId = EA.Id;
            con.LastName = EA.Name;
            con.Phone = EA.Phone;
            CL.add(con);
        }
    }
    INSERT CL;
}
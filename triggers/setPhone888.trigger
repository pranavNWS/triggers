trigger setPhone888 on Account (before insert) 
{
    for(Account EA : trigger.New)
    {
    	if(EA.Industry == 'Banking')
        {
            EA.Phone = '888';
        }
    }
}
/*
*   @Class          :   LiMaCor_SelfSchedulableBatch
*
*   @Author         :   Julián Martínez Cordones <julian.itsa8@gmail.com>
*   @Created        :   2023-02-04
*   @Description    :   LiMaCor_SelfSchedulableBatch
*
*   Modification Log
*   --------------------------------------------------------------------------------------
*   #       Developer                           Date                    Description
*   --------------------------------------------------------------------------------------
*   1       Julian Martinez Cordones            2023-02-04      	    Creation           
*
*/

global class LiMaCor_SelfSchedulableBatch implements Database.Batchable<SObject>, Database.AllowsCallouts, Database.Stateful {

    public LiMaCor_SelfSchedulableBatch() {
    }

    /*
    *	Author: Julián Martínez Cordones <julian.itsa8@gmail.com>
    */
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // add queryLocator to retrieve data to iterate through
    }

    /*
    *	Author: Julián Martínez Cordones <julian.itsa8@gmail.com>
    */
    global void execute(Database.BatchableContext BC, List<SObject> scope) {
        // add logic to execute
    }

    /*
    *	Author: Julián Martínez Cordones <julian.itsa8@gmail.com>
    */
    global void finish(Database.BatchableContext BC) {
        DateTime now = System.now();
        
        String newScheduleTime = '0 ' + now.addMinutes(5).minuteGmt() + ' ' + '* * * ?';

        LiMaCor_SchedulableClass schedulableJob = new LiMaCor_SchedulableClass();
        
        System.schedule('LiMaCor_SchedulableClass XX.' + String.valueOf(now.addMinutes(5).minuteGmt()), newScheduleTime, schedulableJob);
    }
}
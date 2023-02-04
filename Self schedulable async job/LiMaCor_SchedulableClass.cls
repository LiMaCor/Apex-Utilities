/*
*   @Class          :   LiMaCor_SchedulableClass
*
*   @Author         :   Julián Martínez Cordones <julian.itsa8@gmail.com>
*   @Created        :   2023-02-04
*   @Description    :   LiMaCor_SchedulableClass
*
*   Modification Log
*   --------------------------------------------------------------------------------------
*   #       Developer                           Date                    Description
*   --------------------------------------------------------------------------------------
*   1       Julian Martinez Cordones            2023-02-04      	    Creation           
*
*/

global class LiMaCor_SchedulableClass implements Schedulable {

    /*
    *	Author: Julián Martínez Cordones <julian.itsa8@gmail.com>
    */
    global void execute(SchedulableContext sc) {
        Database.executeBatch(new LiMaCor_SelfSchedulableBatch(), 1);

        System.abortJob(sc.getTriggerId());
    }
}
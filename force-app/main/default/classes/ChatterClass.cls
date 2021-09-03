public without sharing class ChatterClass {
    
    @AuraEnabled(cacheable=true)
    public static String getCurrentUser(){
        return [SELECT Id, Name 
                FROM User 
                WHERE Id =:UserInfo.getUserId()
                ].Name;
    }

    @AuraEnabled
    public static List<chatterPostWrapper> getFeeds(Id leadId) {
        List<ChatterPostWrapper> chatterPostWrappers = new List<ChatterPostWrapper>();
        List<FeedItem> feedItems = [SELECT Id, ParentId, Body, 
                                        createdById, 
                                        createdBy.Name, CreatedDate 
                                    FROM FeedItem 
                                    WHERE parentId = :leadId 
                                    AND Type = 'TextPost' 
                                    ORDER BY CreatedDate 
                                    DESC ];
        if(!feedItems.isEmpty()){
            for(FeedItem item: feedItems){
                String dateString = getMessageDate(item.createdDate);
                String speakerName = item.createdBy.Name;
                Boolean isSpeaker = false;
                Id userId = UserInfo.getuserId();
                if(userId == item.createdById){
                    isSpeaker = true;
                }
                chatterPostWrappers.add(new ChatterPostWrapper(item.Id, 
                                                item.createdById, 
                                                speakerName, 
                                                dateString, 
                                                item.Body
                                                .stripHtmlTags(), 
                                                isSpeaker));
            }
        }
        return ChatterPostWrappers;
    }

    @AuraEnabled
    public static List<ChatterPostWrapper> insertChatterPosts(
                Id leadId, 
                String comment) {
        try{
            FeedItem post = new FeedItem();
            post.ParentId = leadId;
            post.createdById = UserInfo.getuserId();
            post.Body = comment;
            post.type = 'TextPost';
            INSERT post;
            return getFeeds(leadId);   
        }catch(exception e){
            system.debug('Something went wrong '+e.getMessage());
            return null;
        }
    }

    private static String getMessageDate(DateTime dTime){
        Long dt1Long = dTime.getTime();
        Long dt2Long = DateTime.now().getTime();
        Long milliseconds = dt2Long - dt1Long;
        Long seconds = milliseconds / 1000;
        Long minutes = seconds / 60;
        Long hours = minutes / 60;
        Long days = hours / 24;

        if(seconds < 60){
            return String.valueOf(seconds + ' seconds ago');
        }
        if(minutes < 60){
            return String.valueOf(minutes + ' minutes ago');
        }
        if(hours < 24){
            return String.valueOf(hours + ' hours ago');
        }
        if(days < 4){
            return String.valueOf(days + ' days ago');
        }
        else{
            return String.valueOf(dTime.format('MMM-d-yyyy'));
        }
    }

    public class ChatterPostWrapper{

        @AuraEnabled
        public String id;
        @AuraEnabled
        public String speaker;
        @AuraEnabled
        public String dateCreated;
        @AuraEnabled
        public String comment;
        @AuraEnabled
        public Boolean isSpeaker;

        public chatterPostWrapper(String id, 
                                String createdById, 
                                String speaker, 
                                String dateCreated, 
                                String comment, 
                                Boolean isSpeaker){
            this.id = id;
            this.speaker = speaker;
            this.dateCreated = dateCreated;
            this.comment = comment;
            this.isSpeaker = isSpeaker;
        }
    }
}

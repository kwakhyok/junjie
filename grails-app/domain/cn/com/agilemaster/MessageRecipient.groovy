package cn.com.agilemaster

/**
 * MessageRecipient
 * A domain class describes the data object and it's mapping to the database
 */
class MessageRecipient {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    User recipient
    MessageStatus status = MessageStatus.UNREAD
	
	/* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated
	
	static belongsTo	= [message:Message]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
        message lazy: false
    }
    
	static constraints = {
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}

enum MessageStatus{
    UNREAD,
    READ,
    DELETED
}

package cn.com.agilemaster

/**
 * TaskPlan
 * A domain class describes the data object and it's mapping to the database
 */
class TaskPlan {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    Date startDate
    Date endDate
    User assignedUser
    Set<String> participants
    Date	dateCreated
    Date	lastUpdated


    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [Task]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        startDate (blank:false)
        endDate (blank:false, validator: {val,obj ->
            return val.after(obj.startDate)
        })
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${task?.title} + ${startDate.dateString}";
	}
}

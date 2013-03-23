package cn.com.agilemaster

/**
 * Task : A general class to describe the organization activity instance.
 * A domain class describes the data object and it's mapping to the database
 *
 */
 class Task {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String code
    String title
    String description
    String status

  //  static TaskCategory  category = TaskCategory.GENERIC

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    /* prerequisite task */
    Task preTask

	static belongsTo	= [project:Project]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [plans:TaskPlan, subTasks:Task]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
       sort 'dateCreated'
       activities sort: 'dateCreated'
    }

    static constraints = {
        code(size: 1..10, nullable: false)
        title(size: 1..30, nullable: false)
        status(shared: 'taskStatus')
        description( nullable: true)
    }


    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${title}";
	}

}

public enum TaskCategory{BID_SECTION, INVESTMENT, PAYMENT, DESIGN, GENERIC}

package webbluefinder.process

import bflaunchers.DBRetrieverLauncher
import wbflisteners.ObservableProcess
import wbflisteners.ProcessesListener
import webbluefinder.Properties;
import webbluefinder.Scene;


class DBRetrieverWrapper extends Process implements ProcessesListener {

    static constraints = {
    }
	
	DBRetrieverWrapper(Scene s){
		super(s)
	}
	
	def getTableNamePiece() {
		return 'dbr'+this.id;
	}
	
	def getName() {
		return 'DBRetrieverWrapper'
	}
	
	def getQuery() {
		return "SELECT ?from, ?to"+
				" WHERE { ?from a <"+scene.fromType+">."+
						" ?to a <"+scene.toType+">."+
						" ?to <"+scene.property+"> ?from. }";
	}
		
	def start() {
//do execute
		Properties p = Properties.getLast()
		System.out.println("worker.prestart()")
		
		def dbr = new DBRetrieverLauncher()
		dbr.addObserver(this)
		
		runAsync {
			//System.out.println(query);
			//System.out.println("Async Previo DBRetriever ");
			dbr.launch(p.hostname+"/"+p.database, this.getQuery(), p.dbuser, p.dbpass, scene.getTableNameFor(this));
			//System.out.println("Async Post DBRetriever ");
			//return "repiola"
		}
		// block until result is called
		//def result = prom.get()
		// block for the specified time
		//def result = p.get(1,MINUTES)
		System.out.println("worker.poststart()")
	}
	
	def getNextProcess() {
		return new PIAWrapper(scene)
	}
	
	def getProcessStep() {
		return 1
	}
	def isDBRetrieverWrapper() {
		return true
	}
	def hasNextProcess() {
		return true
	}

	@Override
	public void computing(ObservableProcess dbr) {
		System.out.println("set computing");
		this.setComputing()
	}

	@Override
	public void stopped(ObservableProcess dbr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void notStarted(ObservableProcess dbr) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void finalized(ObservableProcess dbr) {
		System.out.println("set finalized");
		this.setFinalized()
	}
}
package edu.uiowa.icts.spring;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Disjunction;

import edu.uiowa.icts.sql.Alias;
import edu.uiowa.icts.util.SortColumn;

/**
 * @author rrlorent
 */
public class GenericDaoListOptions {

	private String alias = null;
	private List<String> columns = null;
	private Integer start = null;
	private Integer limit = null;
	private String search = null;
	private List<String> searchColumns = null;
	private List<SortColumn> sorts = null;
	private Map<String, Object> individualLikes = null;
	private Map<String, Object> individualEquals = null;
	private Map<String, Object> notEquals = null;
	private boolean doubleWildCard = true;
	private List<Disjunction> disjunctions = null;
	private List<Conjunction> conjunctions = null;

	private List<Alias> aliases = null;
	
	@SuppressWarnings( "rawtypes" )
	private List<Class> detached = null;

	@SuppressWarnings( "rawtypes" )
	private Class transformation = null;

	public Integer getStart() {
		return start;
	}

	public void setStart( Integer start ) {
		this.start = start;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit( Integer limit ) {
		this.limit = limit;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch( String search ) {
		this.search = search;
	}

	public List<String> getSearchColumns() {
		return searchColumns;
	}

	public void setSearchColumns( List<String> searchColumns ) {
		this.searchColumns = searchColumns;
	}

	public List<SortColumn> getSorts() {
		return sorts;
	}

	public void setSorts( List<SortColumn> sorts ) {
		this.sorts = sorts;
	}

	public void setIndividualLikes( Map<String, Object> individualLikes ) {
		this.individualLikes = individualLikes;
	}

	public Map<String, Object> getIndividualEquals() {
		return individualEquals;
	}

	public void setIndividualEquals( Map<String, Object> individualEquals ) {
		this.individualEquals = individualEquals;
	}

	@SuppressWarnings( "rawtypes" )
	public Class getTransformation() {
		return transformation;
	}

	@SuppressWarnings( "rawtypes" )
	public void setTransformation( Class transformation ) {
		this.transformation = transformation;
	}

	@SuppressWarnings( "rawtypes" )
	public List<Class> getDetached() {
		return detached;
	}

	@SuppressWarnings( "rawtypes" )
	public void setDetached( List<Class> detached ) {
		this.detached = detached;
	}

	public boolean isDoubleWildCard() {
		return doubleWildCard;
	}

	public void setDoubleWildCard( boolean doubleWildCard ) {
		this.doubleWildCard = doubleWildCard;
	}

	public Map<String, Object> getNotEquals() {
		return notEquals;
	}

	public void setNotEquals( Map<String, Object> notEquals ) {
		this.notEquals = notEquals;
	}

	public List<String> getColumns() {
		return columns;
	}

	public void setColumns( List<String> columns ) {
		this.columns = columns;
	}

	public List<Disjunction> getDisjunctions() {
		return disjunctions;
	}

	public void setDisjunctions( List<Disjunction> disjunctions ) {
		this.disjunctions = disjunctions;
	}

	public List<Conjunction> getConjunctions() {
		return conjunctions;
	}

	public void setConjunctions( List<Conjunction> conjunctions ) {
		this.conjunctions = conjunctions;
	}

	public String getAlias() {
		return alias;
	}

	/**
	 * alias for the main domain object 
	 * @param alias
	 */
	public void setAlias( String alias ) {
		this.alias = alias;
	}

	public List<Alias> getAliases() {
		return aliases;
	}

	public void setAliases( List<Alias> aliases ) {
		this.aliases = aliases;
	}
	
	/**
	 * This method does not allow the setting of the alias join type. 
	 * @deprecated use {@link setAliases( List<Alias> )} instead.
	 */
	@Deprecated
	public void setAliases( Map<String, String> aliases ) {
		List<Alias> list = this.aliases;
		if( list == null ){
			list = new ArrayList<Alias>();
		}
		for( String key : aliases.keySet() ){
			list.add( new Alias( key, aliases.get( key ) ) );
		}
		this.aliases = list;
	}

	public Map<String, Object> getIndividualLikes() {
		return individualLikes;
	}
}
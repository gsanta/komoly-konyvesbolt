package komoly.action;

import java.util.ArrayList;
import java.util.List;
import komoly.dao.RatingDao;
import komoly.bean.RatingData;
import komoly.common.BaseActionBean;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;

import org.apache.log4j.Logger;

public class RatingsActionBean extends BaseActionBean {

  static final String RATINGS = "/WEB-INF/web/ratings.jsp";
	static final String FORM = "/WEB-INF/web/ratingform.jsp";
	
	public Resolution rlist(){
		return new ForwardResolution(RATINGS);
	}
	
	public Resolution rform(){
		if (getContext().getUser() != null) {
			return new ForwardResolution(FORM);
		} else return new ForwardResolution(RATINGS);
	}
	/*public Resolution save() {
		 List<RatingData> ratings = getRating();
		  getRating().save(ratings);
		getContext().getMessages().add(
		new SimpleMessage("Rating saved" , ratings)
		);
		return new RedirectResolution(RatingsActionBean.class);
		}
	*/

	private List<RatingData> ratings;
	private int delitem;

	public int getDelitem() {
		return delitem;
	}

	public void setDelitem(int delitem) {
		this.delitem = delitem;
	}

	public Resolution deleteRating() {

		getContext().delRating(delitem);

		return rlist();
	}
	
	
	public List<RatingData> getRatings() {
		return ratings;
	}

	public void setRatings(List<RatingData> ratings) {
		this.ratings = ratings;
	}
}

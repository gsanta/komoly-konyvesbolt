package komoly.action;
import komoly.common.*;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;


public class ShopListActionBean extends BaseActionBean {
  private static final String LIST="/WEB-INF/web/shops.jsp" ;
@DefaultHandler
public Resolution list(){
	return new ForwardResolution(LIST);
	}
}

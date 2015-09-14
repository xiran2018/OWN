package admin.ru.own.www.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.extremecomponents.table.context.Context;
import org.extremecomponents.table.context.HttpServletRequestContext;
import org.extremecomponents.table.limit.Limit;
import org.extremecomponents.table.limit.LimitFactory;
import org.extremecomponents.table.limit.Sort;
import org.extremecomponents.table.limit.TableLimit;
import org.extremecomponents.table.limit.TableLimitFactory;

/**
 * ClassName:ExtremeTablePage
 * Project: 
 * Company: ZTE
 *
 * @author   程仁银
 * @version  
 * @since    Ver 1.1
 * @Date	 Aug 6, 2012		11:30:08 AM
 * @see 	 
 */
@SuppressWarnings("unchecked")
public final class ExtremeTablePage {
	/**
     * 最大记录数.
     */
    public static final int MAX_PAGE_SIZE = 1000000000;
    public static final int defaultPageSize = 10;

    /**
     * 工具类的私有构造方法.
     */
    private ExtremeTablePage() {
    }

    /**
     * 根据DEFAULT_PAGE_SIZE获得数据.
         *
     * @param request 请求
         * @return Limit 封装的数据
     */
    public static Limit getLimit(HttpServletRequest request) {
        return getLimit(request, defaultPageSize);
    }

    /**
     * 从request构造Limit对象实例.
     * Limit的构造流程比较不合理，为了照顾export Excel时忽略信息分页，导出全部数据
     * 因此流程为程序先获得total count, 再使用total count 构造Limit，再使用limit中的分页数据查询分页数据
     * 而SS的page函数是在同一步的，无法拆分，再考虑到首先获得的totalCount
     *
     * @param request 请求
     * @param defaultPageSize 页面记录数
     * @return Limit 封装的数据
     */
    public static Limit getLimit(HttpServletRequest request,
        int defaultPageSize) {
        Context context = new HttpServletRequestContext(request);
        LimitFactory limitFactory = new TableLimitFactory(context);
        TableLimit limit = new TableLimit(limitFactory);
        limit.setRowAttributes(MAX_PAGE_SIZE, defaultPageSize);

        return limit;
    }

    /**
     * 将Limit中的排序信息转化为Map{columnName,升序/降序}.
     * @param limit 封装的页面信息
     * @return Map 排序信息
     */
    public static Map getSort(Limit limit) {
        Map sortMap = new HashMap();
        if (limit != null) {
            Sort sort = limit.getSort();

            if ((sort != null) && sort.isSorted()) {
                sortMap.put(sort.getProperty(), sort.getSortOrder());
            }
        }
        return sortMap;
    }}


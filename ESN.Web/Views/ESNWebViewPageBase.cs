using Abp.Web.Mvc.Views;

namespace ESN.Web.Views
{
    public abstract class ESNWebViewPageBase : ESNWebViewPageBase<dynamic>
    {

    }

    public abstract class ESNWebViewPageBase<TModel> : AbpWebViewPage<TModel>
    {
        protected ESNWebViewPageBase()
        {
            LocalizationSourceName = ESNConsts.LocalizationSourceName;
        }
    }
}
using System.IO;
using System.Threading.Tasks;
using System.Web;
using System;
using System.Web.Mvc;
using Abp.UI;
using Abp.Web.Mvc.Authorization;
using ESN.Authorization;

namespace ESN.Web.Controllers
{
    public class HomeController : ESNControllerBase
    {
        public ActionResult Index()
        {
            return View("~/App/Main/views/layout/layout-frontend.cshtml"); //Layout of the angular application.
        }
        
        public ActionResult Admin()
        {
            var isCanAccess = PermissionChecker.IsGranted(PermissionNames.Pages_Users)
                              || PermissionChecker.IsGranted(PermissionNames.Pages_Roles)
                              || PermissionChecker.IsGranted(PermissionNames.Pages_ApproveBook)
                              || PermissionChecker.IsGranted(PermissionNames.Pages_Category)
                              || PermissionChecker.IsGranted(PermissionNames.Pages_Report)
                              || PermissionChecker.IsGranted(PermissionNames.Pages_BestSeller)
                              || PermissionChecker.IsGranted(PermissionNames.PaymentTicket)
                              || PermissionChecker.IsGranted(PermissionNames.Recharge);

            return isCanAccess ? View("~/App/Main/views/layout/layout.cshtml", model:"admin") : View();
        }

        [HttpPost]
        [Route("Upload")]
        public async Task<ActionResult> Upload(HttpPostedFileBase file)
        {
            try
            {
                if (file != null)
                {
                    var filename = Path.GetFileNameWithoutExtension(file.FileName).Trim();
                    var newFileName = $"{filename}_{Guid.NewGuid()}{Path.GetExtension(file.FileName)}";
                    string path = Path.Combine(Server.MapPath("~/UploadedFiles"), Path.GetFileName(newFileName));
                    file.SaveAs(path);
                    return Json(new
                    {
                        filePath = "/UploadedFiles/" + newFileName
                    }, JsonRequestBehavior.AllowGet);
                }

                throw new UserFriendlyException("Không có file nào được tải lên!");
            }
            catch (Exception)
            {
                throw new UserFriendlyException("Lỗi upload file ảnh");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public async Task<ActionResult> Term()
        {
            return View();
        }
    }
}
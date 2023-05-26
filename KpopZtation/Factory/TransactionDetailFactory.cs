using KpopZtation.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KpopZtation.Factory
{
    public class TransactionDetailFactory
    {
        public static TransactionDetail CreateTrsDetail(int trsId, int albumId, int qty)
        {
            TransactionDetail trsDetail = new TransactionDetail();
            trsDetail.TransactionID = trsId;
            trsDetail.AlbumID = albumId;
            trsDetail.Qty = qty;

            return trsDetail;
        }
    }
}
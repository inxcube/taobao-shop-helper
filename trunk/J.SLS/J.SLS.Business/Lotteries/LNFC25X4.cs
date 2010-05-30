﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;
using Shove;

namespace J.SLS.Business
{
    internal class LNFC25X4 : LotteryBase
    {
        public const string Code = "LNFC25X4";
        public const int ID = 0x2f;
        public const double MaxMoney = 25300.0;
        public const string Name = "辽宁风采25选4";
        public const int PlayType_D = 0x125d;
        public const int PlayType_F = 0x125e;
        public const string sID = "47";

        public LNFC25X4()
        {
            base.id = 0x2f;
            base.name = "辽宁风采25选4";
            base.code = "LNFC25X4";
        }

        public override string AnalyseScheme(string Content, int PlayType)
        {
            string str2;
            string[] strArray = Content.Split(new char[] { '\n' });
            if (strArray == null)
            {
                return "";
            }
            if (strArray.Length == 0)
            {
                return "";
            }
            string str = "";
            if (PlayType == 0x125d)
            {
                str2 = @"(\d\d\s){3}\d\d";
            }
            else
            {
                str2 = @"(\d\d\s){3,24}\d\d";
            }
            Regex regex = new Regex(str2, RegexOptions.Compiled | RegexOptions.IgnoreCase);
            for (int i = 0; i < strArray.Length; i++)
            {
                Match match = regex.Match(strArray[i]);
                if (match.Success)
                {
                    string canonicalNumber = "";
                    string[] strArray2 = this.ToSingle(match.Value, ref canonicalNumber, PlayType);
                    if (((strArray2 != null) && (strArray2.Length >= ((PlayType == 0x125d) ? 1 : 2))) && (strArray2.Length <= 12650.0))
                    {
                        string str4 = str;
                        string[] strArray3 = new string[] { str4, canonicalNumber, "|", strArray2.Length.ToString(), "\n" };
                        str = string.Concat(strArray3);
                    }
                }
            }
            if (str.EndsWith("\n"))
            {
                str = str.Substring(0, str.Length - 1);
            }
            return str;
        }

        public override bool AnalyseWinNumber(string Number)
        {
            string canonicalNumber = "";
            string[] strArray = this.ToSingle(Number, ref canonicalNumber, 0x125d);
            return ((strArray != null) && (strArray.Length == 1));
        }

        public override string BuildNumber(int Num)
        {
            Random random = new Random();
            StringBuilder builder = new StringBuilder();
            ArrayList al = new ArrayList();
            for (int i = 0; i < Num; i++)
            {
                al.Clear();
                for (int j = 0; j < 4; j++)
                {
                    int ball = 0;
                    while ((ball == 0) || base.isExistBall(al, ball))
                    {
                        ball = random.Next(1, 0x1a);
                    }
                    al.Add(ball.ToString().PadLeft(2, '0'));
                }
                LotteryBase.CompareToAscii comparer = new LotteryBase.CompareToAscii();
                al.Sort(comparer);
                string str = "";
                for (int k = 0; k < al.Count; k++)
                {
                    str = str + al[k].ToString() + " ";
                }
                builder.Append(str.Trim() + "\n");
            }
            string str2 = builder.ToString();
            return str2.Substring(0, str2.Length - 1);
        }

        public override bool CheckPlayType(int PlayType_type)
        {
            return ((PlayType_type >= 0x125d) && (PlayType_type <= 0x125e));
        }

        public override double ComputeWin(string Number, string WinNumber, ref string Description, ref double WinMoneyNoWithTax, int PlayType, params double[] WinMoneyList)
        {
            WinNumber = WinNumber.Trim();
            if (WinNumber.Length < 0x10)
            {
                return -1.0;
            }
            string[] strArray = base.SplitLotteryNumber(Number);
            if (strArray == null)
            {
                return -2.0;
            }
            if (strArray.Length < 1)
            {
                return -2.0;
            }
            if ((WinMoneyList == null) || (WinMoneyList.Length < 6))
            {
                return -3.0;
            }
            int num = 0;
            int num2 = 0;
            int num3 = 0;
            double num4 = 0.0;
            WinMoneyNoWithTax = 0.0;
            Description = "";
            for (int i = 0; i < strArray.Length; i++)
            {
                if (strArray[i].Length >= 14)
                {
                    string[] strArray2 = strArray[i].Split(new char[] { ' ' });
                    int num6 = 0;
                    foreach (string str in strArray2)
                    {
                        if (WinNumber.IndexOf(str) >= 0)
                        {
                            num6++;
                        }
                    }
                    if (num6 == 5)
                    {
                        num++;
                        num4 += WinMoneyList[0];
                        WinMoneyNoWithTax += WinMoneyList[1];
                        continue;
                    }
                }
                string canonicalNumber = "";
                string[] strArray3 = this.ToSingle(strArray[i], ref canonicalNumber, PlayType);
                if ((strArray3 != null) && (strArray3.Length >= 1))
                {
                    for (int j = 0; j < strArray3.Length; j++)
                    {
                        if (strArray3[j].Length >= 11)
                        {
                            string[] strArray4 = new string[4];
                            Match match = new Regex(@"(?<R0>\d\d\s)(?<R1>\d\d\s)(?<R2>\d\d\s)(?<R3>\d\d)", RegexOptions.Compiled | RegexOptions.IgnoreCase).Match(strArray3[j]);
                            int num9 = 0;
                            bool flag = true;
                            for (int k = 0; k < 4; k++)
                            {
                                strArray4[k] = match.Groups["R" + k.ToString()].ToString().Trim();
                                if (strArray4[k] == "")
                                {
                                    flag = false;
                                    break;
                                }
                                if (WinNumber.IndexOf(strArray4[k] + " ") >= 0)
                                {
                                    num9++;
                                }
                            }
                            if (flag)
                            {
                                switch (num9)
                                {
                                    case 4:
                                        num2++;
                                        num4 += WinMoneyList[2];
                                        WinMoneyNoWithTax += WinMoneyList[3];
                                        break;

                                    case 3:
                                        num3++;
                                        num4 += WinMoneyList[4];
                                        WinMoneyNoWithTax += WinMoneyList[5];
                                        break;
                                }
                            }
                        }
                    }
                }
            }
            if (num > 0)
            {
                Description = "一等奖" + num.ToString() + "注";
            }
            if (num2 > 0)
            {
                if (Description != "")
                {
                    Description = Description + "，";
                }
                Description = Description + "二等奖" + num2.ToString() + "注";
            }
            if (num3 > 0)
            {
                if (Description != "")
                {
                    Description = Description + "，";
                }
                Description = Description + "三等奖" + num3.ToString() + "注";
            }
            if (Description != "")
            {
                Description = Description + "。";
            }
            return num4;
        }

        private string[] FilterRepeated(string[] NumberPart)
        {
            ArrayList al = new ArrayList();
            for (int i = 0; i < NumberPart.Length; i++)
            {
                int ball = _Convert.StrToInt(NumberPart[i], -1);
                if (((ball >= 1) && (ball <= 0x19)) && !base.isExistBall(al, ball))
                {
                    al.Add(NumberPart[i]);
                }
            }
            LotteryBase.CompareToAscii comparer = new LotteryBase.CompareToAscii();
            al.Sort(comparer);
            string[] strArray = new string[al.Count];
            for (int j = 0; j < al.Count; j++)
            {
                strArray[j] = al[j].ToString().PadLeft(2, '0');
            }
            return strArray;
        }

        public override PlayType[] GetPlayTypeList()
        {
            return new PlayType[] { new PlayType(0x125d, "单式"), new PlayType(0x125e, "复式") };
        }

        public override string ShowNumber(string Number)
        {
            return base.ShowNumber(Number, "");
        }

        public override string[] ToSingle(string Number, ref string CanonicalNumber, int PlayType)
        {
            string[] strArray = this.FilterRepeated(Number.Trim().Split(new char[] { ' ' }));
            CanonicalNumber = "";
            if (strArray.Length < 4)
            {
                CanonicalNumber = "";
                return null;
            }
            for (int i = 0; i < strArray.Length; i++)
            {
                CanonicalNumber = CanonicalNumber + strArray[i] + " ";
            }
            CanonicalNumber = CanonicalNumber.Trim();
            ArrayList list = new ArrayList();
            int length = strArray.Length;
            for (int j = 0; j < (length - 3); j++)
            {
                for (int m = j + 1; m < (length - 2); m++)
                {
                    for (int n = m + 1; n < (length - 1); n++)
                    {
                        for (int num6 = n + 1; num6 < length; num6++)
                        {
                            list.Add(strArray[j] + " " + strArray[m] + " " + strArray[n] + " " + strArray[num6]);
                        }
                    }
                }
            }
            string[] strArray2 = new string[list.Count];
            for (int k = 0; k < list.Count; k++)
            {
                strArray2[k] = list[k].ToString();
            }
            return strArray2;
        }
    }
}

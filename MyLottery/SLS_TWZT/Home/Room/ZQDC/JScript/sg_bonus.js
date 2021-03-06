var sg_bonus = {};
var MMM = 0;

//奖金评测初始化
sg_bonus.init = function() {
    sg_bonus.count = 0;
    sg_bonus.base = 0;
    fw.getId("bonusEvaluating").onclick = sg_bonus.showfromvote;
    fw.getId("bonus_close").onclick = sg_bonus.close;
    fw.ui.drag("bonus_box", "bonus_head");
}

//从投注页面显示
sg_bonus.showfromvote = function(v) {

    sg_bonus.ggtype = sg_vote.ggtype;
    sg_bonus.ggmode = sg_bonus.ggtype == 3 ? sg_vote.ggmList : sg_vote.ggmode;
    if (typeof v == 'undefined' && sg_bonus.ggmode == "") return !!alert("请先选择过关方式！");
    if (typeof v == 'undefined' && trade.baseCount > 10000) return !!alert("请选择10000注以下的方案查看！");

    sg_bonus.nb = sg_vote.nb;
    sg_bonus.data = sg_vote.data;
    sg_bonus.iscut = sg_vote.isCutRepeat;
    sg_bonus.count = sg_vote.count; 		//所选赛事场数
    sg_bonus.base = 2 * 0.65 * trade.multiple;
    sg_bonus.ar = sg_bonus.ggtype == 3 ? fw.each(sg_bonus.ggmode, function(s) { return sg.type2nm[s].n }, []).reverse() : (typeof sg.ggm2num[sg_bonus.ggmode] == "undefined" ? [] : sg.ggm2num[sg_bonus.ggmode]);
    (typeof v == 'undefined') ? sg_bonus.show() : sg_bonus.getPrice();
    return false;
}

//显示
sg_bonus.show = function() {
    fw.dom.clearChild("bonus_vote");
    fw.dom.insertRows2("bonus_prize", '<tr><td>奖金预算加载中，请稍候...</td></tr>', true);
    fw.dom.clearChild("bonus_more");
    fw.getId("bonus_box").style.display = "block";
    fw.ui.setCenter("bonus_box");
    MMM = 0;
    window.setTimeout("sg_bonus.showvote(),sg_bonus.showprize()", 1);
}
sg_bonus.getPrice = function() {
    sg_bonus.showvote();
    sg_bonus.showprize();

}
//显示投注结果
sg_bonus.showvote = function() {
    var sp = [];
    var html = [];
    var getD = function(d) { return d ? '<span class="red">√</span>' : '×' };
    for (var i = 0; i < sg_bonus.count; i++) {
        var oo = sg_bonus.nb[i];
        var o = sg_bonus.data[oo.row];
        var spHTML = fw.getId("selectList").rows[i].cells[3].innerHTML;

        var a = fw.each(spHTML.match(/\([^\)]+/g), function(s) { return +s.slice(1) }); //取SP值
        spHTML = spHTML.replace(/\-1/g, '0')
        fw.array.sortNumber(a);
        a = [a[0], a.slice(-1)[0]];
        if (a[1] == -1) a[1] = 0;
        if (a[0] == -1) a[0] = a[1];
        sp[i] = [o.serialNumber, a[0], a[1], oo.dan];
        html[i] = '<tr class="td6"><td>' + o.serialNumber + '</td><td>' + o.lg + '</td><td style="display:none">' + fw.each(oo.arr, sg.idx2mr, []) + '</td><td>' + spHTML + '</td><td>' + a[0] + '</td><td>' + a[1] + '</td><td>' + getD(oo.dan) + '</td></tr>';
    }
    html.push('<tr><td colspan="7" class="td6">过关方式：<span class="red">' + sg_bonus.ggmode + '</span>    倍数：<span class="red">' + trade.multiple + '倍</span>    方案总金额：<span class="red">' + fw.getId('caseMoney').innerHTML + '元</span></td></tr>');
    html = html.join("");
    fw.dom.insertRows2("bonus_vote", html, true);
    sg_bonus.setsp(sp);
}
//设置SP值
sg_bonus.setsp = function(sp) {
    sg_bonus.sp = { min: { d: [], t: [] }, max: { d: [], t: []} };
    sg_bonus.spn = {};
    fw.callEach(sp, function(a, i) {
        if (a[1] == 0 && a[2] == 0) return;
        MMM++;
        var min = "[" + a[0] + "]" + a[1];
        var max = "[" + a[0] + "]" + a[2];
        sg_bonus.spn[min] = +a[1];
        sg_bonus.spn[max] = +a[2];
        sg_bonus.sp.min[a[3] ? "d" : "t"].push(min);
        sg_bonus.sp.max[a[3] ? "d" : "t"].push(max);
    });
    var f1 = function(a, b) { return sg_bonus.spn[a] - sg_bonus.spn[b] };
    var f2 = function(a, b) { return sg_bonus.spn[b] - sg_bonus.spn[a] };
    sg_bonus.sp.min.d.sort(f1);
    sg_bonus.sp.min.t.sort(f1);
    sg_bonus.sp.max.d.sort(f2);
    sg_bonus.sp.max.t.sort(f2);
}

//显示命中后的奖金
sg_bonus.showprize = function() {

    sg_bonus.hitItem = [];
    sg_bonus.nocutlist = { max: null, min: null };
    var ti = fw.each(sg_bonus.ar, function(i) { return '<td class="td12">' + sg.num2ggm[i] + '</td>' }, []);
    var html = [], n, o, minb, maxb, mina, maxa, minn, maxn, num, tn;

    html[0] = '<tr class="td12"><td class="td12" rowspan="2" width="10%">命中场数</td><td class="td12" colspan="' + ti.length + '">中奖注数</td><td class="td12" rowspan="2" width="8%">倍数</td><td class="td12" colspan="2" width="40%">奖金范围</td></tr>';
    html[1] = '<tr>' + ti.join("") + '<td class="td12">最大奖金</td><td class="td12">最小奖金</td></tr>';
    var iscut = sg_bonus.ggtype == 3 || sg_bonus.iscut;
    var mMax = 0, mMin = 999999999;

    for (var j = 0; j < sg_bonus.count; j++) {
        n = sg_bonus.count - j, minb = "0元", maxb = "0元", minn = 0, maxn = 0;
        if (n != MMM) continue;
        maxa = sg_bonus.getx(sg_bonus.sp.max.d, sg_bonus.sp.max.t, sg_bonus.ar, iscut, n, "max");
        mina = sg_bonus.getx(sg_bonus.sp.min.d, sg_bonus.sp.min.t, sg_bonus.ar, iscut, n, "min");
        num = {};
        fw.callEach(sg_bonus.ar, function(n) { num[n] = 0 })
        for (var k = 0; k < maxa.length; k++) {
            tn = fw.array.multiple(fw.each(maxa[k], function(s) { return sg_bonus.spn[s] }, []));
            if (tn > 0) {
                ++num[maxa[k].length];
                maxn += tn;
            }
        }
        for (var k = 0; k < maxa.length; k++) {
            minn += fw.array.multiple(fw.each(mina[k], function(s) { return sg_bonus.spn[s] }, []));
        }
        num = fw.object.each(num, function(n) { return '<td class="td6">' + n + '注</td>' }, []).join("");
        if (maxn > 0) {
            if (maxn * sg_bonus.base > mMax) mMax = maxn * sg_bonus.base;
            sg_bonus.hitItem.push([j, "max", maxa]);
            maxb = (maxn * sg_bonus.base).toFixed(2) + '元[<span class="sg_bonus1">明细</span>]';
        }
        if (minn > 0) {
            if (minn * sg_bonus.base < mMin) mMin = minn * sg_bonus.base;
            sg_bonus.hitItem.push([j, "min", mina]);
            minb = (minn * sg_bonus.base).toFixed(2) + '元[<span class="sg_bonus1">明细</span>]';
        }
        (maxn > 0 || minn > 0) && html.push('<tr><td class="td6">' + n + '</td>' + num + '<td class="td6">' + trade.multiple + '</td><td class="td6">' + maxb + '</td><td class="td6">' + minb + '</td></tr>');
    }

    if (sg_bonus.hitItem.length == 0) {
        fw.get('jiangjinYS').innerHTML = '0-0';
        fw.dom.insertRows2("bonus_prize", '<tr><td class="red">该方案不中奖！</td></tr>', true);
        fw.dom.insertRows2("bonus_prize", '<tr><td align="center">注：奖金预测sp值为投注时即时sp值，最终奖金以开奖sp值为准</td></tr>', false);
        return false;
    } else {
        if (sg_vote.ggmode == '单关') {
            var mn = trade.getTotalCount() * trade.singlePrice;
            mMin = mMin < mn ? mn : mMin;
            mMax = mMax < mn ? mn : mMax;
        }
        fw.get('jiangjinYS').innerHTML = [mMin.toFixed(), mMax.toFixed()].join('-');
    }
    html = html.join("");
    fw.dom.insertRows2("bonus_prize", html, true);
    fw.dom.insertRows2("bonus_prize", '<tr><td align="center" colspan="5">注：奖金预测sp值为投注时即时sp值，最终奖金以开奖sp值为准</td></tr>', false);
    var obj = trade.getClass("bonus_prize", "span", "sg_bonus1");
    var tb = new fw.ui.tb(obj, "sg_bonus2", "sg_bonus1", sg_bonus.viewmore);
    obj[0].className = "sg_bonus2";
    sg_bonus.viewmore(0);
}

//获取串
sg_bonus.getx = function(spd, spt, ggmode, iscut, hitnum, m) {
    var dn = spd.length;
    var tn = spt.length;
    var n = hitnum - dn;
    if (iscut) return sg_bonus.getbyiscut(spd.slice(0, n > 0 ? dn : dn + n), spt.slice(0, n > 0 ? n : 0), ggmode);

    var glob = spd.concat(spt).slice(0, hitnum);
    return fw.each(sg_bonus.nocutlist[m] || sg_bonus.getbynocut(spd, spt, ggmode, m), function(child) {
        if (fw.array.isChild(glob, child)) return child;
    }, []);
}

//获取串(不去重复)
sg_bonus.getbynocut = function(spd, spt, ggmode, m) {
    var t = fw.math.CR(spt, ggmode[0] - spd.length);
    var r = [], a;
    for (var i = 0, l = t.length; i < l; i++) {
        a = sg_bonus.getbyiscut([], spd.concat(t[i]), ggmode);
        r = r.concat(a);
    }
    sg_bonus.nocutlist[m] = r;
    return r;
}

//获取串(去重复)
sg_bonus.getbyiscut = function(spd, spt, ggmode) {
    var dn = spd.length;
    var tn = spt.length;
    var r = [], ta, n;
    for (var i = 0, l = ggmode.length; i < l; i++) {
        n = ggmode[i];
        ta = fw.math.CR.apply(null, n > dn ? [spt, n - dn] : [spd, n]);
        n > dn && fw.each(ta, function(t) { return spd.concat(t) });
        r = r.concat(ta);
    }
    return r;
}

//查看奖金明细
sg_bonus.viewmore = function(idx) {
    var x = sg_bonus.hitItem[idx];
    var html = ['\
	<tr class="td12" align="center">\
		<td class="td12" width="15%">过关方式</td>\
		<td class="td12" width="10%">中奖注数</td>\
		<td class="td12">中' + (sg_bonus.count - x[0]) + '场 最' + (x[1] == "min" ? "小" : "大") + '奖金 中奖明细</td>\
		<td class="td12" width="20%">奖金</td>\
	</tr>'];
    var ga = {}, num = {}, mn = {};
    fw.callEach(sg_bonus.ar, function(n) { ga[n] = []; num[n] = 0, mn[n] = 0 });
    var sn = 0, tn;
    for (var k = 0; k < x[2].length; k++) {
        sn = fw.array.multiple(fw.each(x[2][k], function(s) { return sg_bonus.spn[s] }, [])) * sg_bonus.base;
        if (sn > 0) {
            tn = x[2][k].length;
            ++num[tn];
            ga[tn].push(x[2][k].join("×") + "×" + trade.multiple + "倍×" + trade.singlePrice + "元×65% = " + sn.toFixed(2) + "元");
            mn[tn] += sn;
        }
    }
    var ggt;
    fw.callEach(sg_bonus.ar, function(n) {
        if (mn[n] == 0) return;
        ggt = (n > 1 ? n + "串1" : "单关");
        html.push('<tr align="center"><td class="td6">' + ggt + '</td><td class="td6">' + num[n] + '注</td><td class="td6">' + ga[n].join("<br/>") + '</td><td class="td6">' + mn[n].toFixed(2) + '元</td></tr>');
    });
    num = fw.object.each(num, function(n) { return n }, []);
    mn = fw.object.each(mn, function(n) { return n }, []);
    html.push('<tr align="center" class="td6"><td>合计：</td><td>' + fw.array.add(num) + '注</td><td>&nbsp;</td><td><b>' + fw.array.add(mn).toFixed(2) + '</b>元</td></tr>');
    html = html.join("");
    fw.dom.insertRows2("bonus_more", html, true);
}

//关闭
sg_bonus.close = function() {
    fw.getId("bonus_box").style.display = "none";
}
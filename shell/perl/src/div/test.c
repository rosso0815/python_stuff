#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

/* Workaround for mapstart: the only op which needs a different ppaddr */
#undef Perl_pp_mapstart
#define Perl_pp_mapstart Perl_pp_grepstart
#define XS_DynaLoader_boot_DynaLoader boot_DynaLoader
EXTERN_C void boot_DynaLoader (pTHX_ CV* cv);

static void xs_init (pTHX);
static void dl_init (pTHX);
static PerlInterpreter *my_perl;


#ifdef BROKEN_STATIC_REDECL
#define Static extern
#else
#define Static static
#endif /* BROKEN_STATIC_REDECL */

#ifdef BROKEN_UNION_INIT
/*
 * Cribbed from cv.h with ANY (a union) replaced by void*.
 * Some pre-Standard compilers can't cope with initialising unions. Ho hum.
 */
typedef struct {
    char *	xpv_pv;		/* pointer to malloced string */
    STRLEN	xpv_cur;	/* length of xp_pv as a C string */
    STRLEN	xpv_len;	/* allocated size */
    IV		xof_off;	/* integer value */
    NV		xnv_nv;		/* numeric value, if any */
    MAGIC*	xmg_magic;	/* magic for scalar array */
    HV*		xmg_stash;	/* class package */

    HV *	xcv_stash;
    OP *	xcv_start;
    OP *	xcv_root;
    void      (*xcv_xsub) (pTHXo_ CV*);
    ANY		xcv_xsubany;
    GV *	xcv_gv;
    char *	xcv_file;
    long	xcv_depth;	/* >= 2 indicates recursive call */
    AV *	xcv_padlist;
    CV *	xcv_outside;
#ifdef USE_THREADS
    perl_mutex *xcv_mutexp;
    struct perl_thread *xcv_owner;	/* current owner thread */
#endif /* USE_THREADS */
    cv_flags_t	xcv_flags;
} XPVCV_or_similar;
#define ANYINIT(i) i
#else
#define XPVCV_or_similar XPVCV
#define ANYINIT(i) {i}
#endif /* BROKEN_UNION_INIT */
#define Nullany ANYINIT(0)

#define UNUSED 0
#define sym_0 0


Static OP op_list[2];
Static UNOP unop_list[1];
Static LISTOP listop_list[3];
Static SV sv_list[14];
Static XPV xpv_list[7];
Static XPVAV xpvav_list[3];
Static XPVHV xpvhv_list[1];
Static XPVIV xpviv_list[1];
static OP * pp_main (pTHX);

static OP op_list[2] = {
	{ 0, 0, NULL, 0, 0, 65535, 0x0, 0x0 },
	{ 0, 0, NULL, 0, 177, 65535, 0x0, 0x0 },
};

static UNOP unop_list[1] = {
	{ (OP*)&listop_list[2], 0, NULL, 0, 190, 65535, 0x5, 0x1, 0 },
};

static LISTOP listop_list[3] = {
	{ 0, 0, NULL, 0, 209, 65535, 0x5, 0x0, 0, 0 },
	{ 0, 0, NULL, 0, 209, 65535, 0x5, 0x0, 0, 0 },
	{ 0, 0, NULL, 1, 178, 65535, 0xd, 0x40, &op_list[1], (OP*)&unop_list[0] },
};

static SV sv_list[14] = {
	{ &xpvav_list[0], 1, 0xa },
	{ &xpvav_list[1], 1, 0xa },
	{ 0, 1, 0x100 },
	{ 0, 1, 0x100 },
	{ &xpv_list[0], 1, 0x4840304 },
	{ &xpv_list[1], 1, 0x4840304 },
	{ &xpv_list[2], 1, 0x4840304 },
	{ &xpv_list[3], 1, 0x4840304 },
	{ &xpviv_list[0], 1, 0x81810301 },
	{ &xpvhv_list[0], 2, 0x2000000b },
	{ &xpvav_list[2], 2, 0xa },
	{ &xpv_list[4], 1, 0x4040004 },
	{ &xpv_list[5], 1, 0x4040004 },
	{ &xpv_list[6], 1, 0x4040004 },
};

static XPV xpv_list[7] = {
	{ 0, 24, 25 },
	{ 0, 2, 3 },
	{ 0, 54, 55 },
	{ 0, 1, 2 },
	{ 0, 21, 22 },
	{ 0, 26, 27 },
	{ 0, 1, 2 },
};

static XPVAV xpvav_list[3] = {
	{ 0, -1, -1, 0, 0.0, 0, Nullhv, 0, 0, 0x1 },
	{ 0, -1, -1, 0, 0.0, 0, Nullhv, 0, 0, 0x1 },
	{ 0, -1, -1, 0, 0.0, 0, Nullhv, 0, 0, 0x1 },
};

static XPVHV xpvhv_list[1] = {
	{ 0, 0, 31, 0, 0.0, 0, Nullhv, -1, 0, 0, 0 },
};

static XPVIV xpviv_list[1] = {
	{ 0, 0, 0, 0 },
};

static int perl_init()
{
	dTARG;
	dSP;
	xpv_list[0].xpv_pv = savepvn("Content-type: text/plain", 24);
	xpv_list[1].xpv_pv = savepvn("\n\n", 2);
	xpv_list[2].xpv_pv = savepvn("Welcome to the Apache Server hosted by Andreas Pfister", 54);
	xpv_list[3].xpv_pv = savepvn("\n", 1);
	{
		SV **svp;
		AV *av = (AV*)&sv_list[1];
		av_extend(av, 7);
		svp = AvARRAY(av);
		*svp++ = (SV*)&PL_sv_undef;
		*svp++ = (SV*)&sv_list[2];
		*svp++ = (SV*)&sv_list[3];
		*svp++ = (SV*)&sv_list[4];
		*svp++ = (SV*)&sv_list[5];
		*svp++ = (SV*)&sv_list[6];
		*svp++ = (SV*)&sv_list[7];
		*svp++ = (SV*)&sv_list[8];
		AvFILLp(av) = 7;
	}
	op_list[0].op_ppaddr = pp_main;
	op_list[1].op_ppaddr = PL_ppaddr[OP_ENTER];
	listop_list[0].op_ppaddr = PL_ppaddr[OP_PRINT];
	listop_list[1].op_ppaddr = PL_ppaddr[OP_PRINT];
	unop_list[0].op_ppaddr = PL_ppaddr[OP_EXIT];
	listop_list[2].op_ppaddr = PL_ppaddr[OP_LEAVE];
	xpv_list[4].xpv_pv = savepvn("D:/programme/perl/lib", 21);
	xpv_list[5].xpv_pv = savepvn("D:/programme/perl/site/lib", 26);
	xpv_list[6].xpv_pv = savepvn(".", 1);
	{
		SV **svp;
		AV *av = (AV*)&sv_list[10];
		av_extend(av, 2);
		svp = AvARRAY(av);
		*svp++ = (SV*)&sv_list[11];
		*svp++ = (SV*)&sv_list[12];
		*svp++ = (SV*)&sv_list[13];
		AvFILLp(av) = 2;
	}
	PL_main_root = (OP*)&listop_list[2];
	PL_main_start = &op_list[0];
	PL_curpad = AvARRAY((AV*)&sv_list[1]);
	PL_initav = (AV *) Nullsv;
	GvHV(PL_incgv) = (HV*)&sv_list[9];
	GvAV(PL_incgv) = (AV*)&sv_list[10];
	av_store(CvPADLIST(PL_main_cv),0,SvREFCNT_inc((AV*)&sv_list[0]));
	av_store(CvPADLIST(PL_main_cv),1,SvREFCNT_inc((AV*)&sv_list[1]));
	PL_amagic_generation= 0;
	return 0;
}
#include "cc_runtime.h"

static
CCPP(pp_main)
{
	I32 oldsave;
	SV **svp, *sv, *src, *dst, *left, *right;
	MAGIC *mg;
	dSP;
  lab_1a7b5c8:
	PL_op = &op_list[1];
	DOOP(PL_ppaddr[OP_ENTER]);
	TAINT_NOT;
	sp = PL_stack_base + cxstack[cxstack_ix].blk_oldsp;
	FREETMPS;
  lab_1a710c0:
	PUSHMARK(sp);
	EXTEND(sp, 2);
	PUSHs((SV*)PL_curpad[3]);
	PUSHs((SV*)PL_curpad[4]);
	PL_op = (OP*)&listop_list[0];
	DOOP(PL_ppaddr[OP_PRINT]);
  lab_1a70f1c:
	TAINT_NOT;
	sp = PL_stack_base + cxstack[cxstack_ix].blk_oldsp;
	FREETMPS;
  lab_1a70f58:
	PUSHMARK(sp);
	EXTEND(sp, 2);
	PUSHs((SV*)PL_curpad[5]);
	PUSHs((SV*)PL_curpad[6]);
	PL_op = (OP*)&listop_list[1];
	DOOP(PL_ppaddr[OP_PRINT]);
  lab_1a7b5e8:
	TAINT_NOT;
	sp = PL_stack_base + cxstack[cxstack_ix].blk_oldsp;
	FREETMPS;
	EXTEND(sp, 1);
	PUSHs((SV*)PL_curpad[7]);
	PL_op = (OP*)&unop_list[0];
	DOOP(PL_ppaddr[OP_EXIT]);
	DOOP(PL_ppaddr[OP_LEAVE]);
	PUTBACK;
	return PL_op;
}

int
main(int argc, char **argv, char **env)
{
    int exitstatus;
    int i;
    char **fakeargv;

    PERL_SYS_INIT3(&argc,&argv,&env);
 
    if (!PL_do_undump) {
	my_perl = perl_alloc();
	if (!my_perl)
	    exit(1);
	perl_construct( my_perl );
	PL_perl_destruct_level = 0;
    }

#ifdef CSH
    if (!PL_cshlen) 
      PL_cshlen = strlen(PL_cshname);
#endif

#ifdef ALLOW_PERL_OPTIONS
#define EXTRA_OPTIONS 2
#else
#define EXTRA_OPTIONS 3
#endif /* ALLOW_PERL_OPTIONS */
    New(666, fakeargv, argc + EXTRA_OPTIONS + 1, char *);
    fakeargv[0] = argv[0];
    fakeargv[1] = "-e";
    fakeargv[2] = "";
#ifndef ALLOW_PERL_OPTIONS
    fakeargv[3] = "--";
#endif /* ALLOW_PERL_OPTIONS */
    for (i = 1; i < argc; i++)
	fakeargv[i + EXTRA_OPTIONS] = argv[i];
    fakeargv[argc + EXTRA_OPTIONS] = 0;
    
    exitstatus = perl_parse(my_perl, xs_init, argc + EXTRA_OPTIONS,
			    fakeargv, NULL);
    if (exitstatus)
	exit( exitstatus );

    sv_setpv(GvSV(gv_fetchpv("0", TRUE, SVt_PV)), argv[0]);
    PL_main_cv = PL_compcv;
    PL_compcv = 0;

    exitstatus = perl_init();
    if (exitstatus)
	exit( exitstatus );
    dl_init(aTHX);

    exitstatus = perl_run( my_perl );

    perl_destruct( my_perl );
    perl_free( my_perl );

    PERL_SYS_TERM();

    exit( exitstatus );
}

/* yanked from perl.c */
static void
xs_init(pTHX)
{
    char *file = __FILE__;
    dTARG;
    dSP;

#ifdef USE_DYNAMIC_LOADING
	newXS("DynaLoader::boot_DynaLoader", boot_DynaLoader, file);
#endif
/* bootstrapping code*/
	SAVETMPS;
	targ=sv_newmortal();
#ifdef DYNALOADER_BOOTSTRAP
	PUSHMARK(sp);
	XPUSHp("DynaLoader",strlen("DynaLoader"));
	PUTBACK;
	boot_DynaLoader(aTHX_ NULL);
	SPAGAIN;
#endif
	FREETMPS;
/* end bootstrapping code */
}
static void
dl_init(pTHX)
{
    char *file = __FILE__;
    dTARG;
    dSP;
/* Dynamicboot strapping code*/
	SAVETMPS;
	targ=sv_newmortal();
	FREETMPS;
/* end Dynamic bootstrapping code */
}

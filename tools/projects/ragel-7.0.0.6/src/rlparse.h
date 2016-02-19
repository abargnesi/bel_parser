/* Automatically generated by Kelbt from "rlparse.kh".
 *
 * Parts of this file are copied from Kelbt source covered by the GNU
 * GPL. As a special exception, you may use the parts of this file copied
 * from Kelbt source without restriction. The remainder is derived from
 * "rlparse.kh" and inherits the copyright status of that file.
 */

#line 1 "rlparse.kh"
/*
 *  Copyright 2001-2007 Adrian Thurston <thurston@complang.org>
 */

/*  This file is part of Ragel.
 *
 *  Ragel is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 * 
 *  Ragel is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 * 
 *  You should have received a copy of the GNU General Public License
 *  along with Ragel; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
 */

#ifndef _RLPARSE_H
#define _RLPARSE_H

#include <iostream>
#include "avltree.h"
#include "parsedata.h"


/* Import scanner tokens. */
#define IMP_Word 128
#define IMP_Literal 129
#define IMP_UInt 130
#define IMP_Define 131

struct ParamList;

/* This is used for tracking the include files/machine pairs. */
struct IncludeHistoryItem
{
	IncludeHistoryItem( const char *fileName, const char *sectionName )
		: fileName(fileName), sectionName(sectionName) {}

	const char *fileName;
	const char *sectionName;
};

typedef Vector<IncludeHistoryItem> IncludeHistory;

struct TokHead
{
	TokHead *next;
};

struct Parser6
{
#line 113 "rlparse.kh"


	#line 70 "rlparse.h"
	struct Parser6_Block *block;
	struct Parser6_LangEl *freshEl;
	int freshPos;
	struct Parser6_LangEl *pool;
	int numRetry;
	int numNodes;
	struct Parser6_LangEl *stackTop;
	struct Parser6_LangEl *lastFinal;
	int errCount;
	int curs;
#line 116 "rlparse.kh"

	void init();
	int parseLangEl( int type, const Token *token );
	void clear();

	Parser6( InputData *id, const char *fileName, char *sectionName,
			const InputLoc &sectionLoc, const HostLang *hostLang,
			MinimizeLevel minimizeLevel,
			MinimizeOpt minimizeOpt );

	int token( InputLoc &loc, int tokId, char *tokstart, int toklen );
	void tryMachineDef( const InputLoc &loc, char *name, 
		MachineDef *machineDef, bool isInstance );

	/* Report an error encountered by the parser. */
	ostream &parse_error( int tokId, Token &token );

	ParseData *pd;

	/* The name of the root section, this does not change during an include. */
	char *sectionName;
	const HostLang *hostLang;

	NameRef nameRef;
	NameRefList nameRefList;

	Vector<bool> exportContext;
	IncludeHistory includeHistory;

	TokHead *tokHead;
	ActionParamList *paramList;

	Parser6 *prev, *next;

	void terminateParser();

	bool parseSubstitutions;
};

#line 121 "rlparse.h"
#define TK_Word 128
#define TK_Literal 129
#define TK_EndSection 130
#define TK_UInt 131
#define TK_Hex 132
#define TK_DotDot 133
#define TK_ColonGt 134
#define TK_ColonGtGt 135
#define TK_LtColon 136
#define TK_Arrow 137
#define TK_DoubleArrow 138
#define TK_StarStar 139
#define TK_ColonEquals 140
#define TK_BarEquals 141
#define TK_NameSep 142
#define TK_BarStar 143
#define TK_DashDash 144
#define TK_DotDotIndep 145
#define TK_StartCond 146
#define TK_AllCond 147
#define TK_LeavingCond 148
#define TK_Middle 149
#define TK_StartGblError 150
#define TK_AllGblError 151
#define TK_FinalGblError 152
#define TK_NotFinalGblError 153
#define TK_NotStartGblError 154
#define TK_MiddleGblError 155
#define TK_StartLocalError 156
#define TK_AllLocalError 157
#define TK_FinalLocalError 158
#define TK_NotFinalLocalError 159
#define TK_NotStartLocalError 160
#define TK_MiddleLocalError 161
#define TK_StartEOF 162
#define TK_AllEOF 163
#define TK_FinalEOF 164
#define TK_NotFinalEOF 165
#define TK_NotStartEOF 166
#define TK_MiddleEOF 167
#define TK_StartToState 168
#define TK_AllToState 169
#define TK_FinalToState 170
#define TK_NotFinalToState 171
#define TK_NotStartToState 172
#define TK_MiddleToState 173
#define TK_StartFromState 174
#define TK_AllFromState 175
#define TK_FinalFromState 176
#define TK_NotFinalFromState 177
#define TK_NotStartFromState 178
#define TK_MiddleFromState 179
#define TK_ColonNfaOpen 180
#define TK_CloseColon 181
#define TK_ColonCondOpen 182
#define TK_ColonNoMaxOpen 183
#define RE_Slash 184
#define RE_SqOpen 185
#define RE_SqOpenNeg 186
#define RE_SqClose 187
#define RE_Dot 188
#define RE_Star 189
#define RE_Dash 190
#define RE_Char 191
#define IL_WhiteSpace 192
#define IL_Comment 193
#define IL_Literal 194
#define IL_Symbol 195
#define KW_Machine 196
#define KW_Include 197
#define KW_Import 198
#define KW_Write 199
#define KW_Action 200
#define KW_AlphType 201
#define KW_Range 202
#define KW_GetKey 203
#define KW_InWhen 204
#define KW_When 205
#define KW_OutWhen 206
#define KW_Eof 207
#define KW_Err 208
#define KW_Lerr 209
#define KW_To 210
#define KW_From 211
#define KW_Export 212
#define KW_PrePush 213
#define KW_PostPop 214
#define KW_Length 215
#define KW_NfaPrePush 216
#define KW_NfaPostPop 217
#define KW_Break 218
#define KW_Exec 219
#define KW_Hold 220
#define KW_PChar 221
#define KW_Char 222
#define KW_Goto 223
#define KW_Call 224
#define KW_Ret 225
#define KW_CurState 226
#define KW_TargState 227
#define KW_Entry 228
#define KW_Next 229
#define KW_Variable 230
#define KW_Access 231
#define KW_Ncall 232
#define KW_Nret 233
#define KW_Nbreak 234
#define TK_SubstRef 235
#define Parser6_tk_eof 236

#line 156 "rlparse.kh"

void clearTokdata( Parser6 *parser );

#endif

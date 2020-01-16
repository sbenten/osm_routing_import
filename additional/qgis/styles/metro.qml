<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingTol="1" simplifyMaxScale="1" version="3.6.0-Noosa" readOnly="0" simplifyDrawingHints="1" simplifyAlgorithm="0" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" labelsEnabled="0" simplifyLocal="1" maxScale="0" minScale="1e+08">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="singleSymbol">
    <symbols>
      <symbol alpha="0.5" force_rhr="0" clip_to_extent="1" name="0" type="line">
        <layer locked="0" pass="0" enabled="1" class="SimpleLine">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="69,117,180,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.26" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="CASE &#xd;&#xa;WHEN  coalesce( &quot;total_tcmtcnt&quot; , 0) > 0  THEN  scale_linear(  &quot;total_tcmtcnt&quot;,  1 , 9600 , 0, 2.16) &#xd;&#xa;ELSE 0.0&#xd;&#xa;END" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property value="ID" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>5</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory sizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" lineSizeType="MM" scaleDependency="Area" rotationOffset="270" minScaleDenominator="0" backgroundColor="#ffffff" barWidth="5" sizeType="MM" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" maxScaleDenominator="1e+08" diagramOrientation="Up" penColor="#000000" width="15" penAlpha="255" opacity="1" height="15" scaleBasedVisibility="0" penWidth="0" enabled="0">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" dist="0" placement="2" obstacle="0" priority="0" showAll="1" linePlacementFlags="18">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OSM_ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OSM_NAME">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OSM_META">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OSM_SOURCE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="OSM_TARGET">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="CLAZZ">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="FLAGS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="SOURCE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="TARGET">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="KM">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="KMH">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="COST">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="REVERSE_CO">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="X1">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Y1">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="X2">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="Y2">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_athcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_rathcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_actcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_ractcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_tathcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_tactcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_acttime">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_racttime">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_cmtcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_rcmtcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="total_tcmtcnt">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="ID" name=""/>
    <alias index="1" field="OSM_ID" name=""/>
    <alias index="2" field="OSM_NAME" name=""/>
    <alias index="3" field="OSM_META" name=""/>
    <alias index="4" field="OSM_SOURCE" name=""/>
    <alias index="5" field="OSM_TARGET" name=""/>
    <alias index="6" field="CLAZZ" name=""/>
    <alias index="7" field="FLAGS" name=""/>
    <alias index="8" field="SOURCE" name=""/>
    <alias index="9" field="TARGET" name=""/>
    <alias index="10" field="KM" name=""/>
    <alias index="11" field="KMH" name=""/>
    <alias index="12" field="COST" name=""/>
    <alias index="13" field="REVERSE_CO" name=""/>
    <alias index="14" field="X1" name=""/>
    <alias index="15" field="Y1" name=""/>
    <alias index="16" field="X2" name=""/>
    <alias index="17" field="Y2" name=""/>
    <alias index="18" field="total_athcnt" name=""/>
    <alias index="19" field="total_rathcnt" name=""/>
    <alias index="20" field="total_actcnt" name=""/>
    <alias index="21" field="total_ractcnt" name=""/>
    <alias index="22" field="total_tathcnt" name=""/>
    <alias index="23" field="total_tactcnt" name=""/>
    <alias index="24" field="total_acttime" name=""/>
    <alias index="25" field="total_racttime" name=""/>
    <alias index="26" field="total_cmtcnt" name=""/>
    <alias index="27" field="total_rcmtcnt" name=""/>
    <alias index="28" field="total_tcmtcnt" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="ID" applyOnUpdate="0"/>
    <default expression="" field="OSM_ID" applyOnUpdate="0"/>
    <default expression="" field="OSM_NAME" applyOnUpdate="0"/>
    <default expression="" field="OSM_META" applyOnUpdate="0"/>
    <default expression="" field="OSM_SOURCE" applyOnUpdate="0"/>
    <default expression="" field="OSM_TARGET" applyOnUpdate="0"/>
    <default expression="" field="CLAZZ" applyOnUpdate="0"/>
    <default expression="" field="FLAGS" applyOnUpdate="0"/>
    <default expression="" field="SOURCE" applyOnUpdate="0"/>
    <default expression="" field="TARGET" applyOnUpdate="0"/>
    <default expression="" field="KM" applyOnUpdate="0"/>
    <default expression="" field="KMH" applyOnUpdate="0"/>
    <default expression="" field="COST" applyOnUpdate="0"/>
    <default expression="" field="REVERSE_CO" applyOnUpdate="0"/>
    <default expression="" field="X1" applyOnUpdate="0"/>
    <default expression="" field="Y1" applyOnUpdate="0"/>
    <default expression="" field="X2" applyOnUpdate="0"/>
    <default expression="" field="Y2" applyOnUpdate="0"/>
    <default expression="" field="total_athcnt" applyOnUpdate="0"/>
    <default expression="" field="total_rathcnt" applyOnUpdate="0"/>
    <default expression="" field="total_actcnt" applyOnUpdate="0"/>
    <default expression="" field="total_ractcnt" applyOnUpdate="0"/>
    <default expression="" field="total_tathcnt" applyOnUpdate="0"/>
    <default expression="" field="total_tactcnt" applyOnUpdate="0"/>
    <default expression="" field="total_acttime" applyOnUpdate="0"/>
    <default expression="" field="total_racttime" applyOnUpdate="0"/>
    <default expression="" field="total_cmtcnt" applyOnUpdate="0"/>
    <default expression="" field="total_rcmtcnt" applyOnUpdate="0"/>
    <default expression="" field="total_tcmtcnt" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" field="ID" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="OSM_ID" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="OSM_NAME" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="OSM_META" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="OSM_SOURCE" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="OSM_TARGET" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="CLAZZ" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="FLAGS" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="SOURCE" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="TARGET" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="KM" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="KMH" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="COST" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="REVERSE_CO" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="X1" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="Y1" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="X2" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="Y2" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_athcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_rathcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_actcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_ractcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_tathcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_tactcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_acttime" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_racttime" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_cmtcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_rcmtcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
    <constraint unique_strength="0" field="total_tcmtcnt" constraints="0" notnull_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="ID" exp="" desc=""/>
    <constraint field="OSM_ID" exp="" desc=""/>
    <constraint field="OSM_NAME" exp="" desc=""/>
    <constraint field="OSM_META" exp="" desc=""/>
    <constraint field="OSM_SOURCE" exp="" desc=""/>
    <constraint field="OSM_TARGET" exp="" desc=""/>
    <constraint field="CLAZZ" exp="" desc=""/>
    <constraint field="FLAGS" exp="" desc=""/>
    <constraint field="SOURCE" exp="" desc=""/>
    <constraint field="TARGET" exp="" desc=""/>
    <constraint field="KM" exp="" desc=""/>
    <constraint field="KMH" exp="" desc=""/>
    <constraint field="COST" exp="" desc=""/>
    <constraint field="REVERSE_CO" exp="" desc=""/>
    <constraint field="X1" exp="" desc=""/>
    <constraint field="Y1" exp="" desc=""/>
    <constraint field="X2" exp="" desc=""/>
    <constraint field="Y2" exp="" desc=""/>
    <constraint field="total_athcnt" exp="" desc=""/>
    <constraint field="total_rathcnt" exp="" desc=""/>
    <constraint field="total_actcnt" exp="" desc=""/>
    <constraint field="total_ractcnt" exp="" desc=""/>
    <constraint field="total_tathcnt" exp="" desc=""/>
    <constraint field="total_tactcnt" exp="" desc=""/>
    <constraint field="total_acttime" exp="" desc=""/>
    <constraint field="total_racttime" exp="" desc=""/>
    <constraint field="total_cmtcnt" exp="" desc=""/>
    <constraint field="total_rcmtcnt" exp="" desc=""/>
    <constraint field="total_tcmtcnt" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="&quot;total_tcmtcnt&quot;" sortOrder="0">
    <columns>
      <column hidden="0" name="ID" type="field" width="-1"/>
      <column hidden="0" name="OSM_ID" type="field" width="-1"/>
      <column hidden="0" name="OSM_NAME" type="field" width="-1"/>
      <column hidden="0" name="OSM_META" type="field" width="-1"/>
      <column hidden="0" name="OSM_SOURCE" type="field" width="-1"/>
      <column hidden="0" name="OSM_TARGET" type="field" width="-1"/>
      <column hidden="0" name="CLAZZ" type="field" width="-1"/>
      <column hidden="0" name="FLAGS" type="field" width="-1"/>
      <column hidden="0" name="SOURCE" type="field" width="-1"/>
      <column hidden="0" name="TARGET" type="field" width="-1"/>
      <column hidden="0" name="KM" type="field" width="-1"/>
      <column hidden="0" name="KMH" type="field" width="-1"/>
      <column hidden="0" name="COST" type="field" width="-1"/>
      <column hidden="0" name="REVERSE_CO" type="field" width="-1"/>
      <column hidden="0" name="X1" type="field" width="-1"/>
      <column hidden="0" name="Y1" type="field" width="-1"/>
      <column hidden="0" name="X2" type="field" width="-1"/>
      <column hidden="0" name="Y2" type="field" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" name="total_athcnt" type="field" width="-1"/>
      <column hidden="0" name="total_rathcnt" type="field" width="-1"/>
      <column hidden="0" name="total_actcnt" type="field" width="-1"/>
      <column hidden="0" name="total_ractcnt" type="field" width="-1"/>
      <column hidden="0" name="total_tathcnt" type="field" width="-1"/>
      <column hidden="0" name="total_tactcnt" type="field" width="-1"/>
      <column hidden="0" name="total_acttime" type="field" width="-1"/>
      <column hidden="0" name="total_racttime" type="field" width="-1"/>
      <column hidden="0" name="total_cmtcnt" type="field" width="-1"/>
      <column hidden="0" name="total_rcmtcnt" type="field" width="-1"/>
      <column hidden="0" name="total_tcmtcnt" type="field" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="CLAZZ" editable="1"/>
    <field name="COST" editable="1"/>
    <field name="FLAGS" editable="1"/>
    <field name="ID" editable="1"/>
    <field name="KM" editable="1"/>
    <field name="KMH" editable="1"/>
    <field name="OSM_ID" editable="1"/>
    <field name="OSM_META" editable="1"/>
    <field name="OSM_NAME" editable="1"/>
    <field name="OSM_SOURCE" editable="1"/>
    <field name="OSM_TARGET" editable="1"/>
    <field name="REVERSE_CO" editable="1"/>
    <field name="SOURCE" editable="1"/>
    <field name="TARGET" editable="1"/>
    <field name="X1" editable="1"/>
    <field name="X2" editable="1"/>
    <field name="Y1" editable="1"/>
    <field name="Y2" editable="1"/>
    <field name="total_actcnt" editable="0"/>
    <field name="total_acttime" editable="0"/>
    <field name="total_athcnt" editable="0"/>
    <field name="total_cmtcnt" editable="0"/>
    <field name="total_ractcnt" editable="0"/>
    <field name="total_racttime" editable="0"/>
    <field name="total_rathcnt" editable="0"/>
    <field name="total_rcmtcnt" editable="0"/>
    <field name="total_tactcnt" editable="0"/>
    <field name="total_tathcnt" editable="0"/>
    <field name="total_tcmtcnt" editable="0"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="CLAZZ"/>
    <field labelOnTop="0" name="COST"/>
    <field labelOnTop="0" name="FLAGS"/>
    <field labelOnTop="0" name="ID"/>
    <field labelOnTop="0" name="KM"/>
    <field labelOnTop="0" name="KMH"/>
    <field labelOnTop="0" name="OSM_ID"/>
    <field labelOnTop="0" name="OSM_META"/>
    <field labelOnTop="0" name="OSM_NAME"/>
    <field labelOnTop="0" name="OSM_SOURCE"/>
    <field labelOnTop="0" name="OSM_TARGET"/>
    <field labelOnTop="0" name="REVERSE_CO"/>
    <field labelOnTop="0" name="SOURCE"/>
    <field labelOnTop="0" name="TARGET"/>
    <field labelOnTop="0" name="X1"/>
    <field labelOnTop="0" name="X2"/>
    <field labelOnTop="0" name="Y1"/>
    <field labelOnTop="0" name="Y2"/>
    <field labelOnTop="0" name="total_actcnt"/>
    <field labelOnTop="0" name="total_acttime"/>
    <field labelOnTop="0" name="total_athcnt"/>
    <field labelOnTop="0" name="total_cmtcnt"/>
    <field labelOnTop="0" name="total_ractcnt"/>
    <field labelOnTop="0" name="total_racttime"/>
    <field labelOnTop="0" name="total_rathcnt"/>
    <field labelOnTop="0" name="total_rcmtcnt"/>
    <field labelOnTop="0" name="total_tactcnt"/>
    <field labelOnTop="0" name="total_tathcnt"/>
    <field labelOnTop="0" name="total_tcmtcnt"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>ID</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>

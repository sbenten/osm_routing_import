<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.6.0-Noosa" simplifyDrawingHints="1" simplifyDrawingTol="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" readOnly="0" simplifyLocal="1" labelsEnabled="0" minScale="1e+08" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" type="invertedPolygonRenderer" preprocessing="0" enableorderby="0">
    <renderer-v2 symbollevels="0" forceraster="0" type="singleSymbol" enableorderby="0">
      <symbols>
        <symbol type="fill" clip_to_extent="1" force_rhr="0" name="0" alpha="1">
          <layer enabled="1" locked="0" pass="0" class="SimpleFill">
            <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
            <prop v="255,255,255,255" k="color"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="0,0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="80,80,80,255" k="outline_color"/>
            <prop v="solid" k="outline_style"/>
            <prop v="3.3" k="outline_width"/>
            <prop v="MapUnit" k="outline_width_unit"/>
            <prop v="solid" k="style"/>
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option type="Map" name="properties">
                  <Option type="Map" name="outlineWidth">
                    <Option type="bool" name="active" value="true"/>
                    <Option type="QString" name="expression" value="max(@map_scale / 1500, 3.3)"/>
                    <Option type="int" name="type" value="3"/>
                  </Option>
                </Option>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </symbols>
      <rotation/>
      <sizescale/>
    </renderer-v2>
  </renderer-v2>
  <customproperties>
    <property value="objectid" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory minScaleDenominator="0" lineSizeType="MM" scaleBasedVisibility="0" width="15" penColor="#000000" labelPlacementMethod="XHeight" penWidth="0" height="15" barWidth="5" sizeType="MM" sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" enabled="0" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" penAlpha="255" scaleDependency="Area" backgroundColor="#ffffff" maxScaleDenominator="1e+08" diagramOrientation="Up" opacity="1">
      <fontProperties style="" description="MS Shell Dlg 2,9.6,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="1" zIndex="0" showAll="1" priority="0" obstacle="0" linePlacementFlags="18" dist="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="objectid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ttwa11cd">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ttwa11nm">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="st_areasha">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="st_lengths">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="objectid"/>
    <alias name="" index="1" field="ttwa11cd"/>
    <alias name="" index="2" field="ttwa11nm"/>
    <alias name="" index="3" field="st_areasha"/>
    <alias name="" index="4" field="st_lengths"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="objectid"/>
    <default applyOnUpdate="0" expression="" field="ttwa11cd"/>
    <default applyOnUpdate="0" expression="" field="ttwa11nm"/>
    <default applyOnUpdate="0" expression="" field="st_areasha"/>
    <default applyOnUpdate="0" expression="" field="st_lengths"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="objectid"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="ttwa11cd"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="ttwa11nm"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="st_areasha"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="st_lengths"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="objectid"/>
    <constraint desc="" exp="" field="ttwa11cd"/>
    <constraint desc="" exp="" field="ttwa11nm"/>
    <constraint desc="" exp="" field="st_areasha"/>
    <constraint desc="" exp="" field="st_lengths"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" type="field" name="objectid" hidden="0"/>
      <column width="-1" type="field" name="ttwa11cd" hidden="0"/>
      <column width="-1" type="field" name="ttwa11nm" hidden="0"/>
      <column width="-1" type="field" name="st_areasha" hidden="0"/>
      <column width="-1" type="field" name="st_lengths" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">D:/Users/sbent/OneDrive/Data/PhD/Sheffield_2</editform>
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
    <field editable="1" name="objectid"/>
    <field editable="1" name="orig_ogc_fid"/>
    <field editable="1" name="st_areasha"/>
    <field editable="1" name="st_lengths"/>
    <field editable="1" name="ttwa11cd"/>
    <field editable="1" name="ttwa11nm"/>
  </editable>
  <labelOnTop>
    <field name="objectid" labelOnTop="0"/>
    <field name="orig_ogc_fid" labelOnTop="0"/>
    <field name="st_areasha" labelOnTop="0"/>
    <field name="st_lengths" labelOnTop="0"/>
    <field name="ttwa11cd" labelOnTop="0"/>
    <field name="ttwa11nm" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>objectid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
